#!/bin/bash

# verify num of args passed
if [ "$#" -ne 2 ]; then
    echo "Error: you need to insert 2 args"
    echo "Usage: $0 <file_path> <text_to_write>"
fi

# assign args to vars
file=$1
text_to_write=$2

#extract dir from complete path
dirpath=$(dirname "$file")

#check if dir exists already
if [ ! -d "$dirpath" ]; then
    echo "Dir does not exist. Let's create it..."
    # -p option is necessary to create dirs recursevely
    mkdir -p "$dirpath"
    #check dir has been created successfully
    if [ $? -ne 0 ]; then
        echo "Dir creation failed!"
        exit 1
    fi
fi

#write string into the file
echo "$text_to_write" > "$file"

#check write operation was success
if [ $? -ne 0 ]; then
    echo "Failed to write into new file!"
    exit 1
fi

echo "File created successfully with new content =)"

exit 0