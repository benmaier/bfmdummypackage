#!/bin/bash

# exit on error
set -e

rm -rf .git
git init
python3 rename_package.py $NEWPACKAGENAME
rm rename_package.py
rm PACKAGE_CREATION_README.md
rm prepare_package.sh
git add .
git commit -m "init"
