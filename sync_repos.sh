#!/bin/bash

BILLINGREPO="https://github.com/OpenPEPPOL/peppol-bis-invoice-3.git"
BILLINGBRANCH="2024-q4-release"
LOGISTICSREPO="https://github.com/OpenPEPPOL/Logistics-bis.git"
LOGISTICSBRANCH="2024-Q4"
POACCREPO="https://github.com/OpenPEPPOL/poacc-upgrade-3.git"
POACCBRANCH="2024-q4-release"



# Function to clone and copy files
sync_repo() {
  local repo_url=$1
  local branch=$2
  local source_path=$3
  local target_path=$4

  echo "Syncing $repo_url $source_path"
  git clone --depth=1 --branch "$branch" "$repo_url" temp-repo
  # Ensure the target directory exists
  mkdir -p "$target_path"
  # Copy contents of the source directory to the target directory
  cp -r temp-repo/"$source_path"/* "$target_path"
  rm -rf temp-repo # Clean up temporary repo
}

# Sync files from multiple repositories without './' in target path
# Rules
sync_repo $BILLINGREPO $BILLINGBRANCH "rules/sch" "rules/sch"
sync_repo $POACCREPO $POACCBRANCH "rules/sch" "rules/sch"
sync_repo $LOGISTICSREPO $LOGISTICSBRANCH "rules/sch" "rules/sch"

# Examples
sync_repo $POACCREPO $POACCBRANCH "rules/examples/Cataloge wo response use cases" "rules/examples/Cataloge wo response use cases"
sync_repo $POACCREPO $POACCBRANCH "rules/examples/Order use cases" "rules/examples/Order use cases"
sync_repo $POACCREPO $POACCBRANCH "rules/examples/Order-response use cases" "rules/examples/Order-response use cases"
sync_repo $LOGISTICSREPO $LOGISTICSBRANCH  "rules/examples" "rules/examples"
# Code lists
sync_repo $BILLINGREPO $BILLINGBRANCH "structure/codelist" "structure/codelist"
sync_repo $LOGISTICSREPO $LOGISTICSBRANCH "structure/codelist" "structure/codelist"
sync_repo $POACCREPO $POACCBRANCH "structure/codelist" "structure/codelist"