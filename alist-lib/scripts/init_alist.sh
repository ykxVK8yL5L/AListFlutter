#!/bin/bash

GIT_REPO="https://github.com/ykxVK8yL5L/alist.git"
TAG_NAME=$(git -c 'versionsort.suffix=-' ls-remote --exit-code --refs --sort='version:refname' --tags $GIT_REPO | tail --lines=1 | cut --delimiter='/' --fields=3)

echo "AList - ${TAG_NAME}"
rm -rf ./src
unset GIT_WORK_TREE
git clone --branch "$TAG_NAME" https://github.com/ykxVK8yL5L/alist.git ./src
rm -rf ./src/.git

mv -f ./src/* ../
rm -rf ./src
