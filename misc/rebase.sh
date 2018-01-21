#!/bin/bash
# 
# This is the nuclear option!
# Basically, you don't care about your commit history, but something (repo size)
# has gotten out of hand and you want to reset everything but keep the current
# state of your repo.
#
# I wrote this because I kept some large binaries in my repo (stupid) and they
# changed over time. Next thing I noticed, my repo was 1.5GB.
#
# try first:
# git reflog expire --expire=now --all && git gc --prune=now --aggressive

# git info
USER="walchko"
EMAIL="${USER}@users.noreply.github.com"

# repo
REPO="git@github.com:MarsUniversity/ece387.git"

if [[ -d ".git" ]]; then
  echo "Found repo"
else
  echo "Couldn't find .git ... please move this script to the top of the repo"
  exit 1
fi

echo "======================"
echo "  Rebasing git"
echo "======================"

# wipe out the old
rm -rf .git

# setup new git repo
git init
# git config user.email ${EMAIL}
# git config user.name ${USER}
git add *
git add .gitignore .travis.yml .travis.yml.linux
git commit -m "Deploying to ${REPO}:${BRANCH}"

# force the contents of this master branch to gh-pages branch
# git push --force --quiet "https://${GITHUB_TOKEN}@${REPO}" master:${BRANCH} > /dev/null 2>&1
git push --force --set-upstream ${REPO} master