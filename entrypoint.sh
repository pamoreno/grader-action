#!/bin/sh
set -e

test_labfiles() {
    cd "$GITHUB_WORKSPACE/$GITHUB_BASE_REF" || return 0
    # Remember current branch name
    work_branch="$(git rev-parse --abbrev-ref HEAD)"
    # Checkout PR target
    git fetch origin "$GITHUB_BASE_REF" --depth=1 || return 0
    git checkout "$GITHUB_BASE_REF" || return 0
    labfiles=$(mktemp)
    mod_labfiles=$(mktemp)
    cp .labfiles "$labfiles" || return 0
    git checkout "$work_branch"
    git diff --name-only "origin/$GITHUB_BASE_REF..." >> "$mod_labfiles"
    if ! cmp "$labfiles" "$mod_labfiles" ; then
        body=$(grep -v -F -f "$labfiles" "$mod_labfiles")
        echo "::set-output name=corrupt::true"
        echo "::set-output name=modfiles::$body"
        return 1
    fi
    return 0
}

test_labfiles || exit 1

exec "$@"
