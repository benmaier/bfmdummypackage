#!/usr/bin/bash

# exit on error
set -e

rm -rf .git
git init
python rename_package.py $NEWPACKAGENAME
rm rename_package.py
rm PACKAGE_CREATION_README.md
git add .
git commit -m "init"
