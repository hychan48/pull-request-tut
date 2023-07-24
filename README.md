# pull-request-tut
github pull request tut. for gist
* https://github.com/hychan48/pull-request-tut

```bash
git branch --show-current > .cache/git-branch-current.txt
# git checkout main
git checkout `cat .cache/git-branch-current.txt`
```

## Make branches
* for a b c
```bash
mkdir -p temp

```

## Initial commit
```bash
#
DATE=`date`
echo a $DATE > temp/a.txt
echo b $DATE > temp/b.txt
echo b $DATE > temp/ab.txt

# echo c $DATE > temp/c.txt
# needed? .bak?
echo a $DATE > temp/a.bak.txt
echo b $DATE > temp/b.bak.txt

echo c $DATE > temp/ab.bak.txt
echo c $DATE > temp/c.bak.txt
# c.txt can be used as reference
```

* initial commit. then modify them from multiple places
## Experiment
```bash
# Init
cd ~/VSCodeProjects
git clone git@github.com:hychan48/pull-request-tut.git


git branch vscode;git checkout vscode;git push -u origin vscode
echo a `date` > temp/a.txt
git commit temp/a.txt -m "VSCodeProjects" -m "experiment vscode"

# Simutanously modify from different place:
cd ~/temp
git clone git@github.com:hychan48/pull-request-tut.git

# pull request, and see the git diff
```
### Highlevel
* git clone


## Vscode
```bash
git status
```

* remember to check LF/CRLF
* add .workspace / git config later

# Environment
1. ~/VScodeProjects/pull-request-tut
2. ~/vsCodeProjects/pull-request-tut
  * cygwin

# Githuhb api
* for validating...?

# .env

# Mermaid Git Graph
* main can be 'c' for now? or just use main
```mermaid
%% In theory
gitGraph
%%    create branches
    commit id: "main"
    branch A
    branch B
%% Normal
%%    A first
    checkout A
    commit tag: "a.1"
    checkout B
    commit tag: "b.1"
%% Stagger
    checkout A
    commit tag: "a.2"
    checkout B
    commit tag: "b.2"

%%    Merge Both into Main
    checkout main
    merge A
    merge B


```
```mermaid
%% Expected
gitGraph
    commit id: "main"
    commit tag: "a.1"
    commit tag: "b.1"
    commit tag: "a.2"
    commit tag: "b.2"
```

# git exp
* https://github.com/hychan48/pull-request-tut/branches
* maybe enable auto-merge?

```bash
git status
git branch --show-current
git branch --list
git branch --list -r

git log main..vsCode
git diff main..vsCode # generates a file

git push --set-upstream origin jc-vscode
git push --set-upstream origin a

git fetch origin
git fetch origin --prune
git fetch origin --prune --dry-run


# Create branch and push to github
git branch -f a
git push --set-upstream origin a
## delete
git push origin --delete a
git branch -D a

# misc:
git branch -D -r origin/a
git branch -d -r a
git branch -D -r a
git branch -d -r origin/a
git branch -D -r origin/a
git push origin

```
## Revision Compare
* behind ahead
```bash
# perfect:
git rev-list --left-right --count main...vsCode
# 0 5
git rev-list --left-right --count a...b
git rev-list --left-right --count b...a
git rev-list --left-right --count jc-vscode...ab
git rev-list --left-right --count main...ab

# open:
code temp/{a,b,ab}.txt

```


# Cache directory / copy
```bash
# from cache
rsync -lptgoD -u --itemize-changes .cache/README.cache.md README.md # this cmd
rsync -lptgoD -u --itemize-changes .cache/index.cache.sh index.sh #

# to cache
mkdir -p .cache/
rsync -lptgoD -u --itemize-changes README.md .cache/README.cache.md # this cmd
rsync -lptgoD -u --itemize-changes index.sh .cache/index.cache.sh #
# diff -q README.md .cache/README.cache.md # -q is --brief
# diff --brief README.md .cache/README.cache.md #
# diff --brief index.sh .cache/index.cache.sh #
# -s is --report-identical-files
# -qs is the best
# diff -q --report-identical-files README.md .cache/README.cache.md #
# always will print something:
diff -qs README.md .cache/README.cache.md | grep -iP "differ|identical"
diff -qs index.sh .cache/index.cache.sh  | grep -iP "differ|identical"
echo $? # 0 if no diff or pipe? hmm
diff README.md .cache/README.cache.md

# https://manpages.debian.org/bookworm/diffutils/diff.1.en.html
# rsync -lptgoD -uv README.md .cache/README.cache.md 
# rsync -lptgoD -uvP --itemize-changes README.md .cache/README.cache.md 
# will show >f.st....
echo $? #
# rsync -a index.sh .cache/index.cache.sh
# diff



# from cache?
```