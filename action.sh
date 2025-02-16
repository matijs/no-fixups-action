#!/usr/bin/env bash

set -euxo pipefail

# The action only works on a pull request so GITHUB_BASE_REF is always there
BASE_SHA=$(git rev-parse --verify "origin/${GITHUB_BASE_REF}^{commit}")
# Get the hash of HEAD and ensure its valid
HEAD_SHA=$(git rev-parse --verify "HEAD^{commit}")



if ! RESULT=$(git log --pretty="%s" "${BASE_SHA}..${HEAD_SHA}"); then
  echo "${RESULT}"
  exit 1
fi

! grep --quiet -E '^(amend|fixup|squash)!' <<< "${RESULT}"
