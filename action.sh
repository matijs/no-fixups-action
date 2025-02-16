#!/usr/bin/env bash

set -euxo pipefail

BASE_REF=$(git rev-parse --verify "origin/${GITHUB_BASE_REF}^{commit}")
#HEAD_REF=$(git rev-parse --verify "origin/${GITHUB_HEAD_REF}^{commit}")

git log --pretty="%H %s"
echo "BASE_REF: ${BASE_REF}"
echo "GITHUB_SHA: ${GITHUB_SHA}"
echo "GITHUB_REF: ${GITHUB_REF}"
MY_SHA=git rev-parse "${GITHUB_REF}^{commit}"
echo "MY_SHA: ${MY_SHA}"

! grep --quiet -E '^(amend|fixup|squash)!' <(git log --pretty=%s "${BASE_REF}..${GITHUB_SHA}")
