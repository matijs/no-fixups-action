#!/usr/bin/env bash

set -euxo pipefail

BASE_REF=$(git rev-parse --verify "origin/${GITHUB_BASE_REF}^{commit}")
HEAD_REF=$(git rev-parse --verify "HEAD^{commit}")

echo "BASE_REF: ${BASE_REF}"
echo "HEAD_REF: ${HEAD_REF}"
git log --pretty="%H %s"

! grep --quiet -E '^(amend|fixup|squash)!' <(git log --pretty=%s "${BASE_REF}..${HEAD_REF}")
