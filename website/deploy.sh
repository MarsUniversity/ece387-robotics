#!/bin/bash
# https://github.com/travis-ci/dpl/blob/master/lib/dpl/provider/pages.rb
#
# WARNING: deploy will wipe out everything, so setup your deployment
# to gh-pages branch in the github settings drop down ... NOT master!
#
# fix: git push origin master --force
#      where master is the branch name

# git info
USER="walchko"
EMAIL="${USER}@users.noreply.github.com"

# repo
REPO="github.com/MarsUniversity/ece387"

# branch to save website too
BRANCH="gh-pages"

# website data is stored here:
FOLDER="www"
TMP="../tmpdir"

set -e

mkdir -p ${TMP}

if [[ -d ${FOLDER} ]]; then
	cp ${FOLDER}/* ${TMP}
else
	echo "${FOLDER} not found"
	ls
	pwd
	exit 1
fi

cd ${TMP}

echo "======================"
echo "  Redoing git"
echo "======================"

# create readme with data
echo "deployed at `date`" > README

# setup new git repo
git init
git config user.email ${EMAIL}
git config user.name ${USER}
git add *
git commit -m "Deploying to ${REPO}:${BRANCH}"

echo "======================"
echo "  git publish"
echo "======================"

# force the contents of this master branch to gh-pages branch
# git push --force --quiet "https://${GITHUB_TOKEN}@${REPO}" master:${BRANCH} > /dev/null 2>&1
git push --force  "https://${GITHUB_TOKEN}@${REPO}" master:${BRANCH}

return 0
