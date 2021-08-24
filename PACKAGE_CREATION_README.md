# Package Building

This repo contains a dummy package that comprises the usual files and package structure
I use for my packages. It comes with

* docs built with `sphinx` (including videos)
* unittest structure for testing with `pytest`
* CircleCI config
* dummy paper script in format for JOSS
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

## Notes

It helps if you have `twine` configured for upload.

I've used this [tutorial for Circle CI](https://circleci.com/blog/setting-up-continuous-integration-with-github/).

This package assumes that you're me. In case you're not me,
I suggest you fork this repo, and replace in that order:

1. email-adress ( `contact ÄT benmaier DOTT org` )
2. website (`benmaier.org`)
3. github-username (`benmaier`)

You can use this script:

```python
import sys
import pathlib

include_fileendings = ["py", "txt", "yml", "cfg", "rst", "md", "ini", "in"]
include_files = ["Makefile"]
exclude_files = ["rename_package.py"]

def rename_in_files(old,new):
    this_dir = pathlib.Path('.').absolute()

    for file in this_dir.glob("**/*"):
        if file.is_file() and \
           ((file.suffix[1:] in include_fileendings) or (file.name in include_files)) and \
           file.name not in exclude_files:
            with open(file,'r') as f:
                text = f.read()
                new_text = text.replace(old,new)
            with open(file,'w') as f:
                f.write(new_text)

if __name__=="__main__":
    rename_in_files("the email-adress given above that I don't want to spell out explicitly", "your@email.org")
    rename_in_files("benmaier.org", "yourwebsite.org")
    rename_in_files("benmaier", "yourgithubhandle")
```
