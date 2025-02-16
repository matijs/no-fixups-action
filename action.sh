#!/usr/bin/env bash

set -euxo pipefail

BASE_REF=$(git rev-parse --verify "origin/${GITHUB_BASE_REF}^{commit}")
#HEAD_REF=$(git rev-parse --verify "origin/${GITHUB_HEAD_REF}^{commit}")

git log --pretty="%H %s"
echo "BASE_REF: ${BASE_REF}"
echo "HEAD_REF: ${HEAD_REF}"
echo "GITHUB_SHA: ${GITHUB_SHA}"

#grep --quiet -E '^(amend|fixup|squash)!' <(git log --pretty=%s "${BASE_REF}..${GITHUB_SHA}")
