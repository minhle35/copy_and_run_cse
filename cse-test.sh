#!/bin/bash
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
    else
        echo "$program is not a directory. Exiting."
        return 1
    fi
    # Check if the copy was successful
    if [ $? -eq 0 ]; then
        echo "Copy successful."

        # Connect to the remote server and run the provided command
        ssh "$remote_user" "cd $remote_path && $command"

        read -p "Do you want to submit? (Type 'No' to exit, otherwise provide the next  command, for exampele 6991 give-crate): " submit

        if [ "$submit" != "No" ];then
            ssh "$remote_user" "cd $remote_path && $submit"
        else
            return 0
        fi

    else
        echo "Failed to run command $command."
    fi
}

read -p "Enter the directory to copy: " program
read -p "Enter the command to run after copying: " command
read -p "Enter the destination on the remote server (leave blank to use the local name): " destination

copy_and_run "$program" "$command" "$destination"