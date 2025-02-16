#!/usr/bin/env bash

set -euxo pipefail

# The action already makes sure that is is a pull request so GITHUB_BASE_REF is always set
BASE_REF=$(git rev-parse --verify "origin/${GITHUB_BASE_REF}^{commit}")

echo "${BASE_REF}"

! grep --quiet -E '^(amend|fixup|squash)!' <(git log --pretty=%s "${BASE_REF}..${GITHUB_SHA}")
