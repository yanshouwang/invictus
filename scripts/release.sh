#!/bin/bash

set -e

tag=$(sed -n 's/^version:[[:space:]]*["'\'']*\([^[:space:]''"''\'']*\).*/\1/p' "invictus/pubspec.yaml")

git tag "$tag"
git push origin "$tag"