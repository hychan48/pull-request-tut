#!/usr/bin/env bash
git checkout jc-vscode

# delete remote branches if needed
bash -f ./utils/remove-test-branches.sh

# Reset
git branch --list
git branch -D ab
git branch -D a
git branch -D b

git branch -f ab
git checkout ab

# setup {a,b,ab}.txt
TS=$(date +%s);DATE=$(date -d "@$TS")
echo $TS $DATE
echo "ab $TS $DATE" > temp/a.txt
echo "ab $TS $DATE" > temp/b.txt
echo "ab $TS $DATE" > temp/ab.txt
function pushToGH(){

  git push --set-upstream origin a
  git push --set-upstream origin b
  git push --set-upstream origin ab
  echo "https://github.com/hychan48/pull-request-tut/compare/ab...a?expand=1"
  echo "https://github.com/hychan48/pull-request-tut/compare/ab...b?expand=1"
  git checkout ab
}
function add_files() {
    git add temp/a.txt
    git add temp/b.txt
    git add temp/ab.txt
}
add_files
git commit -m "ab $TS $DATE"

# create a and b
git branch -f a
git branch -f b

# verify tmp 0 0; 0 0
git rev-list --left-right --count main...ab
git rev-list --left-right --count ab...a
git rev-list --left-right --count ab...b

# ab1 new
TS=$(date +%s);DATE=$(date -d "@$TS")
echo $TS $DATE

# a1 'tag' - focus on only non conflicting changes? but ahead
git checkout a
echo "a1 $TS $DATE" >> temp/a.txt
git add temp/a.txt
git commit -m "a1 $TS $DATE"

# b1 'tag'
git checkout b
echo "b1 $TS $DATE" >> temp/b.txt
git add temp/b.txt
git commit -m "b1 $TS $DATE"

# verify a1 and b1
git rev-list --left-right --count a...b # 1 1
git rev-list --left-right --count b...a # 1 1

git rev-list --left-right --count ab...a # 0 1
git rev-list --left-right --count ab...b # 0 1


# v2
pushToGH
echo pushing sleeping
echo "https://github.com/hychan48/pull-request-tut/branches"
sleep 5

# ab2 new
TS=$(date +%s);DATE=$(date -d "@$TS")
echo $TS $DATE

# a2 'tag'
git checkout a
echo "a2 $TS $DATE" >> temp/a.txt
git add temp/a.txt
git commit -m "a2 $TS $DATE2"

# b2 'tag'
git checkout b
echo "b2 $TS $DATE" >> temp/b.txt
git add temp/b.txt
git commit -m "b2 $TS $DATE"


# manual verify
## maybe add delay or something... it's way too quick
# code temp/{a,b,ab}.txt
git status
# git status |grep -ioE -C 3 'on branch (.*)' #
git branch --list
# git branch --show-current


pushToGH


# probably want to verify 0 1 0 1 kidna thing
exit 0
# housekeeping
git checkout jc-vscode
