#!/bin/bash

# Function to clone and copy files
sync_repo() {
  local repo_url=$1
  local branch=$2
  local source_path=$3
  local target_path=$4

  git clone --depth=1 --branch "$branch" "$repo_url" temp-repo
  # Ensure the target directory exists
  mkdir -p "$target_path"
  # Copy contents of the source directory to the target directory
  cp -r temp-repo/"$source_path"/* "$target_path"
  rm -rf temp-repo # Clean up temporary repo
}

# Sync files from multiple repositories without './' in target path
sync_repo "https://github.com/OpenPEPPOL/poacc-upgrade-3.git" "2024-q4-release" "rules/sch" "rules/sch"
sync_repo "https://github.com/OpenPEPPOL/peppol-bis-invoice-3.git" "2024-q4-release" "rules/sch" "rules/sch"

