#!/usr/bin/env bash
# assuming they exist

# pipe to file
# git ls-remote --exit-code --heads origin #
git ls-remote --exit-code --heads origin | tee .cache/git-branch-remote.txt
# grep .cache/git-branch-remote.txt -e "heads/rnggg" || echo 'not exists' #
# grep .cache/git-branch-remote.txt -e "heads/main" && echo 'exists' #

ITEMS=(a b ab)
for ITEM in ${ITEMS[@]}; do
    echo $ITEM # a b ab
    # todo maybe check

    git branch -D $ITEM

    # delete if exists
    grep .cache/git-branch-remote.txt -e "heads/$ITEM" && git push origin --delete $ITEM
    
    
done