#!/bin/bash

# Function to clone and copy files
sync_repo() {
  local repo_url=$1
  local branch=$2
  local source_path=$3
  local target_path=$4

  git clone --depth=1 --branch "$branch" "$repo_url" temp-repo
  cp -r temp-repo/"$source_path" "$target_path"
  rm -rf temp-repo # Clean up temporary repo
}

# Sync files from multiple repositories
sync_repo "https://github.com/OpenPEPPOL/poacc-upgrade-3.git" "2024-q4-release" "rules/sch" "./rules/sch"
sync_repo "https://github.com/OpenPEPPOL/peppol-bis-invoice-3.git" "2024-q4-release" "rules/sch" "./rules/sch"


# Sync SCH Folder from OpenPEPPOL POACC Repository
#git clone --depth=1 --branch 2024-q4-release https://github.com/OpenPEPPOL/poacc-upgrade-3.git source-repo
#cp -r source-repo/rules/sch ./rules/sch # Copy SCH folder to the target path
#git config user.name "GitHub Actions"
#git config user.email "actions@github.com"
#git add rules/sch
#git commit -m "Sync SCH folder from OpenPEPPOL repository"

# Sync SCH Folder from OpenPeppol Billing Repository