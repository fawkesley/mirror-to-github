#!/bin/sh -eux

# See https://help.github.com/articles/duplicating-a-repository/

THIS_DIR=$(dirname $0)
CLONE_DIRECTORY=${THIS_DIR}/repo.git

source_settings() {
    . ${THIS_DIR}/settings.sh
}

get_latest_upstream() {
    if [ ! -d "${CLONE_DIRECTORY}" ]; then
        git clone --mirror "${SOURCE_REPO}" "${CLONE_DIRECTORY}"
    else
        cd "${CLONE_DIRECTORY}"
        git fetch
        cd -
    fi
}

push_to_github() {
    cd "${CLONE_DIRECTORY}"
    git remote set-url --push origin https://${GITHUB_USERNAME}:${GITHUB_TOKEN}@github.com/${GITHUB_USERNAME}/${GITHUB_REPO}
    git push --mirror
    cd -
}

source_settings
get_latest_upstream
push_to_github
