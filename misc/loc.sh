#!/usr/bin/env bash
#
# Given a github repo, this will clone it and count the lines of code

set -e

TMP=/var/tmp/temp-linecount-repo

git clone --depth 1 "$1" ${TMP}
printf "('${TMP}' will be deleted automatically)\n\n\n"
cloc ${TMP}
rm -rf ${TMP}
