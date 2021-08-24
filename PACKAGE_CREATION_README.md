# Package Building

This repo contains a dummy package that comprises the usual files and package structure
I use for my packages. It comes with

* docs built with `sphinx` (including videos)
* unittest structure for testing with `pytest`
* CircleCI config
* Python-code only (e.g. no C++)

## How-to

### What

1. clone this repo
2. remove `.git` dir
3. remove directories that you don't need (e.g. `paper`)
4. initialize new git directory
5. rename the package
6. remove this file and the renaming file

### How

Or set package name first

```bash
NEWPACKAGENAME=newpackagename
```

Then run

```bash
git clone git@github.com:benmaier/bfmdummypackage.git
cd bfmdummypackage
rm -rf .git
git init
python rename_package.py $NEWPACKAGENAME
rm rename_package.py
rm PACKAGE_CREATION_README.md
git add .
git commit -m "init"
```

### Use script

```bash
NEWPACKAGENAME=newpackagename ./prepare_package.sh
```
