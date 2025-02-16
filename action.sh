#!/usr/bin/env bash

set -euxo pipefail

BASE_REF=$(git rev-parse --verify "origin/${GITHUB_BASE_REF}^{commit}")

git log --pretty=%s

! grep --quiet -E '^(amend|fixup|squash)!' <(git log --pretty=%s "${BASE_REF}..${GITHUB_SHA}")
