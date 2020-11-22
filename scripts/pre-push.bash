#!/usr/bin/env bash

echo "Running pre-push hook"

./scripts/run-brakeman.bash
if [ $? -ne 0 ]; then
 echo "Brakeman must pass before pushing!"
 exit 1
fi

./scripts/run-rubocop.bash

# $? stores exit value of the last command
if [ $? -ne 0 ]; then
 echo "Code must be clean before pushing!"
 exit 1
fi
