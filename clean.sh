#!/bin/bash

# Path to the folder containing .c files
codes_folder="codes"

# Path to the test vector file
test_vector_file="test_vectors.txt"

# Iterate through each compiled executable and test with input from the test vector file
for executable in "$codes_folder"/*; do
    # Check if it's an executable file
    if [ -x "$executable" ] && [[ "$executable" != *.c ]]; then
        rm -rf $executable
    fi
done
