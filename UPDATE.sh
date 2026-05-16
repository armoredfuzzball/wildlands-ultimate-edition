#!/bin/bash

# Check if git is installed
if ! command -v git &> /dev/null; then
  echo "Git is not installed. Please install git and try again."
  read -p "Press Enter to exit..."
  exit 1
fi

if [ ! -d ".git" ]; then
  echo "Git repository not found. Initializing..."
  git init
  git remote add origin https://github.com/ArmoredFuzzball/Wildlands-Ultimate-Edition.git
  echo "Fetching from remote..."
  git fetch origin
  echo "Checking out release branch..."
  git checkout -b release origin/release -f
else
  echo "Available branches:"
  git branch -r
  echo
  read -p "Enter the branch to switch to. If you don't know what you're doing, just press Enter. Do not include origin/ (default: release): " userinput
  if [ -z "$userinput" ]; then
    branch="release"
  else
    branch="$userinput"
  fi
  echo "Switching to branch: $branch"
  git fetch origin
  git checkout "$branch" 2>/dev/null || git checkout -b "$branch" "origin/$branch" -f
  git reset --hard "origin/$branch"
fi

echo "Update complete!"
read -p "Press Enter to exit..."
