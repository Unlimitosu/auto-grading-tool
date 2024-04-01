#!/bin/bash

# Path to the folder containing .c files
codes_folder="codes"

# Path to the test vector file
test_vector_file="test_vectors.txt"

# Iterate through each .c file in the codes folder
for file in "$codes_folder"/*.c; do
    # Compile the .c file
    gcc "$file" -o "${file%.c}"
done

# Iterate through each compiled executable and test with input from the test vector file
for executable in "$codes_folder"/*; do
    # Check if it's an executable file
    if [ -x "$executable" ] && [[ "$executable" != *.c ]]; then
        # Extract the filename without extension
        filename=$(basename "$executable")
        
        # Initialize a variable to store the result
        code_correct=true
        
        # Read test vectors two lines at a time
        while IFS= read -r input && IFS= read -r output; do
            # Run the executable with the input and capture the output
            result=$(./"$executable" <<< "$input")
            
            # Check if the output matches the expected output
            if [ "$result" != "$output" ]; then
                # If any test fails, set code_correct to false
                code_correct=false
                # Break out of the loop if the code is incorrect
                break
            fi
        done < "$test_vector_file"
        
        # Print whether the code is correct after testing all test vectors
        if [ "$code_correct" = true ]; then
            echo "$filename: pass"
        else
            echo "$filename: INCORRECT TEST VECTOR"
        fi
    fi
done
