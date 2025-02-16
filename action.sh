#!/usr/bin/env bash

set -euxo pipefail

BASE_SHA=$(git rev-parse --verify "origin/${GITHUB_BASE_REF}^{commit}")
HEAD_SHA=$(git rev-parse --verify "HEAD^{commit}")

! grep --quiet -E '^(amend|fixup|squash)!' <(git log --pretty=%s "${BASE_SHA}..${HEAD_SHA}")
