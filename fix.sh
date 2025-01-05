#!/bin/bash

# Loop through all directories in the current directory
for dir in */; do
    # Remove the trailing slash from the directory name
    dirname="${dir%/}"

    # Execute the commands with the directory name
    rm -rf "$dirname/.git"
    git rm -rf --cached "$dirname"
    git add "$dirname"
done
