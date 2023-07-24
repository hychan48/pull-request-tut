#!/usr/bin/env bash
# for resetting / debugging
# for loop
exit 0
git fetch origin
git branch --list
git branch --list -r
git ls-remote --exit-code --heads origin main jc-vscode # works
git ls-remote --exit-code --heads origin m* #works

# have to use * though
# git ls-remote --exit-code --heads origin <name>
# if contains then delete
ITEMS=(a b ab)
for ITEM in ${ITEMS[@]}; do
    echo $ITEM # a b ab
    git branch -D $ITEM
    git push origin --delete $ITEM
done
# 
git push origin --delete a
git branch -D a