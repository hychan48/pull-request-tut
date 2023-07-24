#!/usr/bin/env bash
git branch --list

git checkout ab

# cleanup
git branch -D ab-local
git branch -D ab-squashed
git push --delete origin ab-squashed
git push --delete origin ab-local

# ab-local
git checkout -b ab-local

git rev-list --left-right --count ab...a

# interseting...
git rev-list --left-right --count ab...b # 0 1
# git rev-list --left-right --count ab..b # guess more accurate 0 2

# https://github.com/hychan48/pull-request-tut/compare/ab...a?expand=1
# https://github.com/hychan48/pull-request-tut/compare/ab...b?expand=1
git merge -m 'ab order a' a #
git merge -m 'ab order b' b # with squash it lokod linear to me
git push --set-upstream origin ab-local

# ab-local-squashed
git checkout ab
git checkout -b ab-squashed
git merge --squash -m 'ab order a squashed' a
git merge --squash -m 'ab order b squashed' b
git push --set-upstream origin ab-squashed

# end
git checkout ab
echo "https://github.com/hychan48/pull-request-tut/branches"

exit 0
git checkout ab-local

# maybe i dont need date... and just ab a1 a2
# defn not successful