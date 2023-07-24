#!/usr/bin/env bash
# source and execute? or what
# init
# should c be my main? and branch from there?
# or i guess maybe make branch c as 'main' so it doesnt polute?
# guess it really doesnt matter though
# bash -f ./index.sh

# https://git-scm.com/docs/git-branch
# reset branches a b c
# git checkout main
git branch --show-current > .cache/git-branch-current.txt
# git checkout main
git checkout `cat .cache/git-branch-current.txt`


git branch -D a
git branch -D b
git branch -D c

# c is the fake
git branch -f c


DATE=`date`
echo a $DATE > temp/a.txt
echo a $DATE > temp/a.bak.txt

# git branch -d a
git branch -f a
git checkout a
git branch -f b


# Housekeeping
git checkout `cat .cache/git-branch-current.txt`
# git checkout `cat .cache/git-branch-current.txt` && rm .cache/git-branch-current.txt
