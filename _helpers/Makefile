.PHONY: help compile final-pdf links

####################################################################################################################
# Directory

# NOTE: update this

dir = ~/your_directory

####################################################################################################################
# Help

help: ## Print all commands (including this one)
	@python3 $(dir)_helpers/ascii_graphic.py
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
	
####################################################################################################################
# Resume Functions

compile: ## Compile using XeLaTeX while supressing errors
	-@bash $(dir)/_helpers/compile_xelatex.sh > /dev/null 2>&1 || true
	@echo 'Compiled ✅'

compile-log: ## Compile using XeLaTeX and print logs
	@bash $(dir)/_helpers/compile_xelatex.sh

final-pdf: ## Export the output.pdf and rename it
	@bash $(dir)/_helpers/create_final_resume_pdf.sh

links: ## Print Website and LinkedIn links
	@python3 $(dir)/_helpers/print_links.py
