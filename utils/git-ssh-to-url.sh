#!/usr/bin/env sh

# Input SSH URL
## todo - get from git config or something / cli / prompt etc
ssh_url="git@github.com:hychan48/pull-request-tut.git"

# Remove the "git@" prefix
without_git=${ssh_url#git@}

# Replace ":" with "/"
https_url="https://${without_git/://}"

# Remove the ".git" extension
https_url=${https_url%.git}

echo $https_url

# Expected output and validate
expected="https://github.com/hychan48/pull-request-tut"
## validate / assert
if [ "$https_url" != "$expected" ]; then
    echo "Expected $expected, got $https_url"
    exit 1
fi

