# Resume Workflow 

This project provides an automated workflow for creating, organizing, and maintaining your job application resumes using LaTeX. It uses a combination of Make, Bash, and Python scripts to set up a smooth and consistent resume creation process. 

## Features

This workflow includes several key features, which are implemented through make recipes. These recipes are distributed across two different versions of Makefiles in this project. If you're unsure of which make recipes you can run, check with `make help`

- `make new-resume`: Prompts for a company name and job title, then sets up everything you need to create a LaTeX resume 
- `make compile`: Compiles your LaTeX resume using XeLaTeX
- `make final-pdf`: Renames and moves the output file to a higher directory
- `make links`: Generates the LinkedIn URL and website/blog/portfolio URL that every job application typically asks for
- Handles existing job or job/company combinations gracefully

## Prerequisites

To use this workflow, you need the following installed on your machine:

- VS Code
  - Note: This workflow is designed with VS Code in mind. However, you can make this requirement redundant by replacing instances of the word `code` in the `create_resume_files.sh` script with the command to open your preferred text editor
- A LaTeX distribution that contains the XeLaTeX compiler
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

You can also search for all variables associated with a `# NOTE: update this` comment to identify variables that require updating.

## Example Workflow

1. In the root directory, run `make new-resume`. If successful, a new directory will be created in the file explorer and three files should open automatically
2. Paste the command that was copied to your clipboard into the terminal and run it. This command will navigate you to the correct folder in your new directory and allow you to take advantage of the LaTeX compilation related make recipes.
3. Open the `job_description.txt` file and paste the job description for the position you're applying for. This will help you tailor your resume to the specific role and keep track of the job requirements
4. If you haven't set up default resume TeX files to be copied into each new folder, then copy and paste your TeX code into the `main.tex` file. If you're using one of the provided templates (such as the one in the sample directory), you will also need to paste code into the `resume_config.cls` file
5. Run `make compile` to compile your resume. You can view the output by opening the `main.pdf` file
6. Once you are satisfied with your resume, run `make final-pdf`. This command will save your resume using the proper naming convention and export it to a directory one level higher in order to seperate it from the other files.

By following these steps, you can efficiently create, compile, and export your resumes