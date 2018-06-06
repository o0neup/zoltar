#!/usr/bin/env bash

$GOAL=test

if [ "${TRAVIS_SECURE_ENV_VARS}" = "true" ]; then
    $GOAL=verify
fi

mvn -Dbigquery.project.arg="-Dbigquery.project=dummy-project" \
  clean \
  checkstyle:checkstyle \
  findbugs:findbugs \
  $GOAL
