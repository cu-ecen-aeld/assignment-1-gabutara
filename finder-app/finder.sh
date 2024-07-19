#!/bin/bash

# verify num of args passed
if [ "$#" -ne 2 ]; then
    echo "Error: you need to pass 2 args."
    echo "Usage: $0 <dir> <string_to_search>"
    exit 1
fi

# verify if the dir exists
filesdir=$1
string_to_search=$2

if [ ! -d "$filesdir" ]; then
    echo "$filesdir is not a valid directory!"
    exit 1
fi

# count numb of files in the dir
# -type f option with find consider only "regular" files
# wc -l cmd counts the lines returned from the find cmd (i.e., the num of files found)
num_files=$(find "$filesdir" -type f | wc -l)

# count num of lines containing the string
num_match_lines=$(grep -r "$string_to_search" "$filesdir" | wc -l)

#print results
echo "The number of files are $num_files and the number of matching lines are $num_match_lines"

exit 0