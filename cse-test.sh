#!/bin/bash

# always copy as a directory
# set up SSH key to access into zXXXXXXX@login.cse.unsw.edu.au in advance
# functionality to run an independent file is not complete
copy_and_run(){
    local program="$1"
    local command="$2"
    local destination="$3"

    local remote_user="zXXXXXXX@login.cse.unsw.edu.au"

    program_basename=$(basename "$program")
    if [ -z "$destination" ];then
        destination="$program_basename"
    else
        destination="$destination/$program_basename"
    fi

    local remote_path="~/$destination"

    if [ -d "$program" ]; then
        echo "$program is a directory, copying recursively."
        scp -r "$program" "$remote_user:$remote_path"
    elif [ -f "$program" ];then
        echo "$item is a file, copying."
        scp "$item" "$remote_user:$remote_path"
    else
        echo "$item is neither a file nor a directory. Exiting."
        return 1
    fi
    # Check if the copy was successful
    if [ $? -eq 0 ]; then
        echo "Copy successful."

        # Connect to the remote server and run the provided command
        ssh "$remote_user" "cd $remote_path && 6991 autotest"
    else
        echo "Failed to run command $command."
    fi
}



read -p "Enter the directory to copy: " program
read -p "Enter the command to run after copying: " command
read -p "Enter the destination on the remote server (leave blank to use the local name): " destination

copy_and_run "$program" "$command" "$destination"