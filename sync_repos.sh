#!/bin/bash

BILLINGREPO="https://github.com/OpenPEPPOL/peppol-bis-invoice-3.git"
BILLINGBRANCH="2025-q4-mr"
LOGISTICSREPO="https://github.com/OpenPEPPOL/Logistics-bis.git"
LOGISTICSBRANCH="Release_1_2_Dev"
POACCREPO="https://github.com/OpenPEPPOL/poacc-upgrade-3.git"
POACCBRANCH="2025-q4-mr"

# Function to clone and copy files
sync_repo() {
  local repo_url=$1
  local branch=$2
  local source_path=$3
  local target_path=$4

  echo "Syncing $repo_url $source_path"
  git clone --depth=1 --branch "$branch" "$repo_url" temp-repo

  if [ -d "temp-repo/$source_path" ]; then
    mkdir -p "$target_path"
    cp -rvf temp-repo/"$source_path"/* "$target_path"
  elif [ -f "temp-repo/$source_path" ]; then
    mkdir -p "$(dirname "$target_path")"
    cp -vf temp-repo/"$source_path" "$target_path"
  else
    echo "Source path not found: $source_path"
    rm -rf temp-repo
    return 1
  fi

  rm -rf temp-repo
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
sync_repo $LOGISTICSREPO $LOGISTICSBRANCH "rules/examples" "rules/examples"

# Code lists
sync_repo $BILLINGREPO $BILLINGBRANCH "structure/codelist" "structure/codelist"
sync_repo $LOGISTICSREPO $LOGISTICSBRANCH "structure/codelist" "structure/codelist"
sync_repo $POACCREPO $POACCBRANCH "structure/codelist" "structure/codelist"

# Tests
sync_repo $BILLINGREPO $BILLINGBRANCH "rules/unit-UBL-SE" "rules/unit-UBL-SE" 
sync_repo $LOGISTICSREPO $LOGISTICSBRANCH "rules/unit-common"  "rules/unit-common" 
sync_repo $POACCREPO $POACCBRANCH "rules/unit-common"  "rules/unit-common" 
sync_repo $POACCREPO $POACCBRANCH "rules/unit-common"  "rules/unit-order" 
sync_repo $POACCREPO $POACCBRANCH "rules/unit-common"  "rules/order-agreement" 
sync_repo $POACCREPO $POACCBRANCH "rules/unit-common"  "rules/order-response" 
sync_repo $POACCREPO $POACCBRANCH "rules/unit-common"  "rules/unit-catalogue" 
sync_repo $POACCREPO $POACCBRANCH "rules/unit-common"  "rules/unit-invoice-response" 

# Guides
sync_repo $POACCREPO $POACCBRANCH "guides/profiles/28-ordering" "guides/profiles/28-ordering"
sync_repo $POACCREPO $POACCBRANCH "guides/profiles/3-order-only" "guides/profiles/3-order-only"
sync_repo $POACCREPO $POACCBRANCH "guides/profiles/42-orderagreement" "guides/profiles/42-orderagreement"
sync_repo $POACCREPO $POACCBRANCH "guides/profiles/63-invoiceresponse" "guides/profiles/63-invoiceresponse"
sync_repo $POACCREPO $POACCBRANCH "guides/profiles/64-catalogue-wo-response" "guides/profiles/64-catalogue-wo-response"
sync_repo $LOGISTICSREPO $LOGISTICSBRANCH "guides/profiles/66-advanceddespatchadvice" "guides/profiles/66-advanceddespatchadvice"
sync_repo $LOGISTICSREPO $LOGISTICSBRANCH "guides/profiles/67-advanceddespatchadvice_w_receiptadvice" "guides/profiles/67-advanceddespatchadvice_w_receiptadvice"
sync_repo $LOGISTICSREPO $LOGISTICSBRANCH "guides/profiles/68-weightstatement" "guides/profiles/68-weightstatement"
sync_repo $LOGISTICSREPO $LOGISTICSBRANCH "guides/profiles/69-transportexecutionplan_w_request" "guides/profiles/69-transportexecutionplan_w_request"
sync_repo $LOGISTICSREPO $LOGISTICSBRANCH "guides/profiles/70-transportexecutionplan" "guides/profiles/70-transportexecutionplan"
sync_repo $LOGISTICSREPO $LOGISTICSBRANCH "guides/profiles/71-waybill" "guides/profiles/71-waybill"
sync_repo $LOGISTICSREPO $LOGISTICSBRANCH "guides/profiles/72-transportationstatus_w_request" "guides/profiles/72-transportationstatus_w_request"
sync_repo $LOGISTICSREPO $LOGISTICSBRANCH "guides/profiles/73-transportationstatus" "guides/profiles/73-transportationstatus"
sync_repo $LOGISTICSREPO $LOGISTICSBRANCH "guides/shared" "guides/shared"

# Namespaces
sync_repo $LOGISTICSREPO $LOGISTICSBRANCH "structure/namespace" "structure/namespace"