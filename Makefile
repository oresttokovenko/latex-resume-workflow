.PHONY: help new-resume links

####################################################################################################################
# Help

help: ## Print all commands (including this one)
	@python3 _helpers/ascii_graphic.py
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
	
####################################################################################################################
# Resume Functions

new-resume: ## Create the resume LaTeX files
	@bash _helpers/create_resume_files.sh

links: ## Print Website and LinkedIn links
	@python3 _helpers/print_links.py
