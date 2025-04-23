# GitHub Pages CI/CD Deployment Workflow

## Overview

This project demonstrates a simple Continuous Integration and Continuous Deployment (CI/CD) pipeline using GitHub Actions to automatically deploy a static website to GitHub Pages whenever changes are made to the `index.html` file.

## Project Structure

```
gh-deployment-workflow/
├── .github/
│   └── workflows/
│       └── deploy.yml       # GitHub Actions workflow file
├── index.html              # Main website content
└── README.md                # Project documentation
```

## Features

- Automated deployment to GitHub Pages
- Triggered only by changes to `index.html`
- Full CI/CD pipeline in GitHub Actions
- Zero-configuration setup (after initial repository setup)

## Prerequisites

- GitHub account
- Basic knowledge of Git and GitHub
- GitHub Pages enabled for the repository

## Setup Instructions

1. **Create a new repository** named `gh-deployment-workflow`
   ```bash
   git init gh-deployment-workflow
   cd gh-deployment-workflow
   ```

2. **Create the index.html file**:

3. **Create the workflow directory**:
   ```bash
   mkdir -p .github/workflows
   ```

4. **Create the deploy.yml workflow file** 

5. **Commit and push**:

⚙️ How It Works
Automatically deploys when index.html changes

No setup needed beyond adding the files

After the workflow completes successfully (takes about 1-2 minutes), your site will be available.