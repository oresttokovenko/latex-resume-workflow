#!/bin/bash

# exist script if error
set -e
company_exists=false

read -p "Company Name: " company_name
read -p "Job Title: " job_title

# check user input
if [[ -z "$company_name" || -z "$job_title" ]]; then
  echo -e "\033[31mCompany name and job title are required\033[0m"
  exit 1
fi

# construct the target directory path
target_dir="${PWD}/${company_name}/${job_title}"
company_dir="${PWD}/${company_name}"

# check if directories already exist
if [[ -d "$company_dir" ]]; then
  echo -e "\n📁 There is already a directory for the company \033[1m$company_name\033[0m \n"
  if [[ -d "$target_dir" ]]; then
    echo -e "Job directory for \033[1m$job_title\033[0m also already exists under company \033[1m$company_name\033[0m. Please choose a different job title \n"
    exit 1
  else
    echo -e "Only the job directory will be created. Please continue \n"
    company_exists=true
  fi
fi


# make directories and create files
mkdir -p "$target_dir/resume" && \
cp -r ~/Desktop/miscellaneous/Employment/_helpers/Makefile "$target_dir/resume/" && \
touch "$target_dir/job_description.txt" "$target_dir/resume/main.tex" "$target_dir/resume/resume_config.cls"

# check if everything went fine
if [[ $? -ne 0 ]]; then
  echo -e "\033[31mAn error occurred while setting up the files and directories.\033[0m"
  exit 1
fi

# open the files in vs code
code "${target_dir}/resume/main.tex"
code "${target_dir}/resume/resume_config.cls"
code "${target_dir}/job_description.txt"

# print results
if [ "$company_exists" = false ]; then
  echo -e "✅ \033[1m$company_name\033[0m company directory created.\n"
fi
echo -e "✅ \033[1m$job_title\033[0m resume files & directory created."

# copy new directory to clipboard
var="cd \"$target_dir/resume/\""
echo "$var" | pbcopy
echo -e "\n📋 'cd' command copied to clipboard - ⌘ + v to paste\n"
echo -e "🛠️  run 'make help' for more commands \n" 
echo -e "🏠 run 'cd ../../../' to return to root directory \n" 
