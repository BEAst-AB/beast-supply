#!/bin/bash

BILLINGREPO="https://github.com/OpenPEPPOL/peppol-bis-invoice-3.git"
BILLINGBRANCH="master"
LOGISTICSREPO="https://github.com/OpenPEPPOL/Logistics-bis.git"
LOGISTICSBRANCH="main"
POACCREPO="https://github.com/OpenPEPPOL/poacc-upgrade-3.git"
POACCBRANCH="master"



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
sync_repo $BILLINGREPO $BILLINGBRANCH "structure/syntax/part" "structure/syntax/part"
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

# Code lists
sync_repo $POACCREPO $POACCBRANCH "guides/profiles/1-catalogueonly" "guides/profiles/1-catalogueonly"
sync_repo $POACCREPO $POACCBRANCH "guides/profiles/64-catalogue-wo-response" "guides/profiles/64-catalogue-wo-response"
sync_repo $LOGISTICSREPO $LOGISTICSBRANCH "guides/profiles/66-advanceddespatchadvice" "guides/profiles/66-advanceddespatchadvice"
sync_repo $LOGISTICSREPO $LOGISTICSBRANCH "guides/profiles/67-advanceddespatchadvice_w_response" "guides/profiles/67-advanceddespatchadvice_w_response"
sync_repo $LOGISTICSREPO $LOGISTICSBRANCH "guides/profiles/68-weightstatement" "guides/profiles/68-weightstatement"
sync_repo $LOGISTICSREPO $LOGISTICSBRANCH "guides/profiles/69-transportexecutionplan_w_request" "guides/profiles/69-transportexecutionplan_w_request"
sync_repo $LOGISTICSREPO $LOGISTICSBRANCH "guides/profiles/70-transportexecutionplan" "guides/profiles/70-transportexecutionplan"
sync_repo $LOGISTICSREPO $LOGISTICSBRANCH "guides/profiles/71-waybill" "guides/profiles/71-waybill"
sync_repo $LOGISTICSREPO $LOGISTICSBRANCH "guides/profiles/72-transportationstatus_w_request" "guides/profiles/72-transportationstatus_w_request"
sync_repo $LOGISTICSREPO $LOGISTICSBRANCH "guides/profiles/73-transportationstatus" "guides/profiles/73-transportationstatus"
