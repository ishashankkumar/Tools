#!/bin/bash

# Check if an argument is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <repo_name>"
  exit 1
fi

# Set the repository name
REPO_NAME="$1"

# Create a local directory
mkdir -p "$REPO_NAME"
cd "$REPO_NAME" || exit

echo "Initialized local directory: $REPO_NAME"

# Initialize Git repository
git init -b master

echo "Initialized Git repository"

# Create a GitHub repository using GitHub CLI
gh repo create "$REPO_NAME" --public --source=. --remote=origin

if [ $? -ne 0 ]; then
  echo "Failed to create GitHub repository"
  exit 1
fi

echo "GitHub repository created: https://github.com/ishashankkumar/$REPO_NAME"

# Add initial commit
touch README.md
echo "# $REPO_NAME" > README.md
git add .
git commit -m "Initial commit"

echo "Initial commit created"

# Push to GitHub
git push -u origin master

echo "Repository pushed to GitHub successfully"

