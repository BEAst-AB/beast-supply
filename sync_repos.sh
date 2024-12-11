#!/bin/bash

# Sync SCH Folder from OpenPEPPOL POACC Repository
git clone --depth=1 --branch 2024-q4-release https://github.com/OpenPEPPOL/poacc-upgrade-3.git source-repo
cp -r source-repo/rules/sch ./rules/sch # Copy SCH folder to the target path
git config user.name "GitHub Actions"
git config user.email "actions@github.com"
git add rules/sch
git commit -m "Sync SCH folder from OpenPEPPOL repository"

# Sync SCH Folder from OpenPeppol Billing Repository