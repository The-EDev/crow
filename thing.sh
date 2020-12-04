#!/bin/sh
set +e  
git config --local user.name "Travis CI"
git config --local user.email "travis@travis-ci.org"
git fetch --tags -f
git tag -d Nightly-CD
git push --delete https://${GH_REPO_TOKEN}@${GH_REPO_REF} Nightly-CD
git tag  Nightly-CD -m "new deploy on $(date +"%Y-%m-%d %T")"
git push https://${GH_REPO_TOKEN}@${GH_REPO_REF} --tags -f
