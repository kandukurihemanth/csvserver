#!/bin/bash

start=$1
end=$2

# Generate the CSV file
output_file="inputFile"

# Remove the output file if it already exists
rm -f "$output_file"


for ((i=start; i<=end; i++)); do
    random_number=$((RANDOM % 1000))
    echo "$i, $random_number" >> "$output_file"
done

echo "CSV file '$output_file' has been generated."
