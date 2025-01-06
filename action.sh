#!/usr/bin/env bash

set -euxo pipefail

# Try remote refs first, fallback to SHA if not found
BASE_REF=$(git rev-parse --verify "origin/${GITHUB_BASE_REF}^{commit}" 2>/dev/null || echo "${GITHUB_BASE_SHA}")
HEAD_REF=$(git rev-parse --verify "origin/${GITHUB_HEAD_REF}^{commit}" 2>/dev/null || echo "${GITHUB_SHA}")

# Verify we have valid refs
if [ -z "${BASE_REF}" ] || [ -z "${HEAD_REF}" ]; then
    echo "Error: Could not determine BASE_REF or HEAD_REF"
    exit 1
fi

# Original commit check
! grep --quiet -E '^(amend|fixup|squash)!' <(git log --pretty=%s "${BASE_REF}..${HEAD_REF}")
