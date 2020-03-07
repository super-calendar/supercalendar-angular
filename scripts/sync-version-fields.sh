#!/usr/bin/env bash

#
# sends the `version` fields in package.json to projects/fullcalendar/package.json
# leaves the modifications as staged changes, but does not commit.
#

set -e # always immediately exit upon error

scripts_dir=`dirname $0`
root_dir="$scripts_dir/.."
dest_dir="$scripts_dir/../projects/fullcalendar"

cd "$root_dir"
version=$(node -e 'console.log(require("./package").version)')
cd -

cd "$dest_dir"
npm version --no-git-tag-version --allow-same-version "$version"
cd -

git add "$dest_dir/package.json"
