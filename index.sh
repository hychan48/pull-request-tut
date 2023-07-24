#!/usr/bin/env bash
# source and execute? or what
# init
# should c be my main? and branch from there?
# or i guess maybe make branch c as 'main' so it doesnt polute?
# guess it really doesnt matter though
# bash -f ./index.sh

# https://git-scm.com/docs/git-branch
# git checkout main
exit 0
git branch --show-current > .cache/git-branch-current.txt
# git checkout main
git checkout `cat .cache/git-branch-current.txt`

# or maybe call it ab
# reset branches a b ab / can use prune but w/e
# doesnt delete a though
# git branch -D -r origin/a
## might comment out later
git branch -D a
git branch -D b
git branch -D ab

# setup a,b,ab for new branch
git branch -f ab
git checkout ab


# Experiment
## setup files
TS=$(date +%s);DATE=$(date -d "@$TS")
echo $TS $DATE

echo "ab $TS $DATE" > temp/a.txt
echo "ab $TS $DATE" > temp/b.txt
echo "ab $TS $DATE" > temp/ab.txt
### commit and branch

###
git branch -f a
git branch -f b


# git branch -d a

git checkout a
git branch -f b


# Housekeeping
git checkout `cat .cache/git-branch-current.txt`
# git checkout `cat .cache/git-branch-current.txt` && rm .cache/git-branch-current.txt

# git push <remote_name> --delete <branch_name>
# git push origin --delete a
# git push origin --delete b
# git push origin --delete c

