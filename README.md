# Resume Workflow 

This project provides an automated workflow for creating, organizing, and maintaining your job application resumes using LaTeX. It uses a combination of Make, Bash, and Python scripts to set up a smooth and consistent resume creation process. 

## Features

- `make new-resume`: Prompts for a company name and job title, then sets up everything you need to create a LaTeX resume 
- `make compile`: Compiles your LaTeX resume using XeLaTeX
- `make final-pdf`: Renames and moves the output file to a higher directory
- `make links`: Generates the LinkedIn URL and website/blog/portfolio URL that every job application typically asks for
- Handles existing job or job/company combinations gracefully

## Prerequisites

To use this workflow, you need the following installed on your machine:

- A LaTeX distribution
- Python version 3.7 or higher
- A method for viewing pdfs in your IDE. I use the following VS code [extension](https://marketplace.visualstudio.com/items?itemName=tomoki1207.pdf) which has hot reloading. 

### Installing LaTeX

You can install LaTeX using Homebrew with the following command:

```bash
brew install --cask mactex-no-gui
```

## Getting Started

Once you have cloned this project, you need to update the following:

- `resume_file_name` variable in  `_helpers/create_final_resume_pdf.sh`
- `linkedin_link_url` and `website_name` variables in `_helpers/print_links.py`
- `dir` variable in `_helpers/Makefile`

Alternatively, you can search for all variables connected to a `# NOTE: update this` comment to find variables that need updating.
