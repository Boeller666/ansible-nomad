#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
#+                                                                           +#
#+       THIS MAKEFILE WILL HELP YOU START WORKING WITH THE UNDERLYING       +#
#+     REPOSITORY. SHOW HELP VIA 'make' OR 'make help' IN YOUR TERMINAL.     +#
#+                                                                           +#
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#

##@ HELPERS

.PHONY: help

help: ## Display this help.
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-30s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)
.DEFAULT_GOAL := help

##@ ENVIRONMENT TASKS

pyenv: ## Create a pyenv environment for the current repository.
	@python3 -m venv pyenv
	@echo "execute '. pyenv/bin/activate' to activate your environment"

requirements: ## Install pip requirements.
	@pip3 install -r requirements.txt

##@ MOLECULE TASKS

pre-test:
	@test $(scenario) || (echo "please provide a scenario:" && molecule list && exit 1)

test: pre-test ## Call molecule test for a [scenario] (to keep your test instances add keep=true)
	@if [ "$(keep)" == "true" ]; then \
		molecule destroy -s $(scenario) && molecule test -s $(scenario) --destroy never ; \
	 else \
		molecule destroy -s $(scenario) && molecule test -s $(scenario) --destroy always ; \
	 fi