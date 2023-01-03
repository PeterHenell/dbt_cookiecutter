# What is this
This project is a cookiecutter (https://github.com/cookiecutter/cookiecutter) project for dbt projects.

It contains basic folder structures for dbt, devcontainer for visual studio code, mounts for ssh and gcloud configs.

# Pre-Requisites
cookiecutter installed (brew install cookiecutter, or pip install cookiecutter)



# How to use
1. in the directory you wish to create the new project type

`cookiecutter https://github.com/PeterHenell/dbt_cookiecutter`

2. Follow the dialog and enter values for each value

3. Open the new folder in vscode and load the devcontainer

4. Open a new terminal i vscode and run poetry run dbt debug
