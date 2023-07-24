#!/usr/bin/env bash
# assuming they exist

# pipe to file
# git ls-remote --exit-code --heads origin #
git ls-remote --exit-code --heads origin | tee .cache/git-branch-remote.txt
# grep "heads/main" .cache/git-branch-remote.txt && echo 'exists' #
# grep "heads/main-sdfsdfsdf" .cache/git-branch-remote.txt || echo 'dne' #

ITEMS=(a b ab)
ITEMS=(a b ab ab-local ab-squashed)
for ITEM in ${ITEMS[@]}; do
    echo $ITEM # a b ab
    git branch -D $ITEM
    # delete if exists
    grep "heads/$ITEM" .cache/git-branch-remote.txt && git push origin --delete $ITEM
done
