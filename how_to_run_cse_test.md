# Automate copy projects and run on UNSW CSE machine
This script automates the process of copying a local project directory to the UNSW CSE machine and running a specified command on the remote server. It eliminates the need for manually transferring files and ensures that your project is executed on the remote server with ease.

By using this script, you can:

Automatically transfer a directory to the remote server (CSE machine).
Run a command immediately after the transfer.
Optionally submit or perform additional actions after running the command.

How the Program Works
The script:

Copies a directory from your local machine to the CSE server.
Runs a command (provided by the user) on the copied directory on the CSE server.
Prompts for an additional submit command after running the first command.
It ensures that the correct directory is copied and that the commands are executed efficiently on the remote server.

Steps to Use the Program:

1. Clone the Repository
To get started, you need to clone the repository from GitHub to your local machine.

Open a terminal and navigate to the directory where you want to clone the repository (e.g., Downloads).
```
cd ~/Downloads
```
```
git clone git@github.com:minhle35/copy_and_run_cse.git
```
2. Navigate to the project directory
if you are currently at Downloads:
Once you have cloned the repository, navigate to the project folder:
```
cd ~/Downloads/copy_and_run_cse
```
Or move to wherever you cloned the project in step 1.

3. Set up SSH access (if you have not already done):
Before you can copy files or run commands on the CSE server, you need to set up SSH access. This ensures you can connect to the remote server without being prompted for a password every time.

Follow this detailed guide from UNSW to set up SSH keys:
https://taggi.cse.unsw.edu.au/FAQ/SSH_Keys/

4. Prepare the Script for Execution
After setting up SSH, you need to grant execution permissions to the script:
```
chmod 755 cse-test.sh
```
5. run the script
```
./cse-test.sh
```

6. Follow the Prompts:
During execution, the script will prompt you for various inputs:

1. Directory to Copy:
Provide the directory (not of the file) what holds the file(s) of the project, to make sure correct directory, run command `pwd`to make sure

2. Command to Run After Copying::
When prompted the command to run after copying, provide the exact command (with or without white space(s)). This could include compilation, testing, or any other task.

3. Destination on Remote Server::
When prompted the destination on remote server, provide the path for copy destination as well as further command in the previous command. If left blank, the script will use the directory name provided in step 1 as the destination.

4. Copying Process:
If all paths are correct and the SSH connection is successful, the directory will be copied to the specified destination on the remote server.

5. Submit Command (Optional):
After running the specified command, the script will prompt you with Do you want to submit?
If you enter No, the script will terminate.
If you want to execute an additional command (e.g., a submission script), provide the submit command.

