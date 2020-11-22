#!/usr/bin/env bash

echo "Running pre-commit hook"

./scripts/run-tests.bash
if [ $? -ne 0 ]; then
 echo "Tests must pass before committing!"
 exit 1
fi
