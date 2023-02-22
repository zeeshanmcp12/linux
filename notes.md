# LFCS (Linux Foundation Certified System Administrator) Notes

## Essential commands

### Login to Linux

- local with text-mode
- local with gui
- remote with text-mode -> console -> works with ssh
- remote with gui -> works with VNC or Remote desktop

### SSH

- SSH -> Secure shell
- telnet -> not secured method to connect to as it does not encrypt anything on same network.
- SSH daemon -> It's a program that runs in the background on the server running linux os.
  - this ssh daemon runs on server
  - this ssh daemon listens on incoming connection from client computer.
  - to be able to connect to this ssh daemon (on server), we need something called "SSH client"
- SSH client
  - This client will run on our local laptop/desktop

### Read, and use system documentation

Ways to find out the command or read the documentation:

- --help
  - ls --help
- man
- sudo mandb
  - This will purge the old manuals and update the manuals.
- searching command
  - apropos <command_to_search>
    - sudo mandb
      - update db is required before executing apropos command
  - apropos director -> director is a short to search command that creates directory
  - apropos -s <section_of_manual_page> <command>
    - apropos -s 1,8 director
- TAB and autocomplete
  - Type some words and press TAB to see the command
  - systemctl

### Create, Delete, Copy and Move Files and Directories

- What is a file system tree?
  - top notch is root (/) directory and then sub directories
  - / -> root directory
  - /home -> under root
    - /abdullah
    - /asim
  - /var
    - log
  - /etc
    - nfsmount.conf
- What is an absolute path?
  - Always start out with the root directory represented by slash (/)
  - Complete path of file or directory
    - /home/zeeshan/scripts/script.sh
    - cd /var/log
- What is a relative path?
  - pwd -> print working directory
    - starting directory for a user might be /home/zeeshan/
    - root or super user will be from /root directory
  - Which is refer to as short path
  - to change the directory using reletive path:
    - cd ..
  - ../../script.sh
  - ../ -> means go one directory up
  - ../../<filename>
  - cd - -> go to previous directory
- Listing files and directories
  - ls
  - ls -a
    - -a comes from the word all
  - ls -l
    - list files and directories in long listing format
  - ls -al
  - ls -h -> -h -> human readable format
    - shows size in human readable format like bytes, kilobytes and mega bytes
    - ls -alh
- Change Directory
  - cd / -> go to root directory
  - cd - -> go to previous directory
  - cd ~ -> go to home directory
  - cd .. -> go one directory up
- Create New file
  - touch <filename>
  - touch /home/zeeshan/<filename> # the way to create a file using absolute path
  - touch ../abdullah/<filename> # if we are in /zeeshan directory # the way to create a file using relative path
    - ../ # go one directory up which is /home
    - /abdullah # home dir for abdullah
  - echo "Hello world" > /Hello/hello.txt
    - this will create the file named "hello.txt" and write "Hello world" text in that file.
- Create new directory
  - mkdir # comes from 'make directory'
- Copy files/directories
  - cp -r -> recursive
  - cp -r [source] [destination]
    - -r is a command line option (or called flag) that means copy the directory recursively.
      - which also means, copy the directory and all the files inside this directory.
  - cp -r Receipts/ BackupDir/
    - copy everything from Receipts to BackupDir
- Move files/directories
  - mv Receipt.pdf Receipts/
  - mv Receipt.pdf OldReceipt.pdf
    - to rename a file
  - mv Receipts/ OldReceipts/
    - to rename a directory
    - we don't need to mention -r flag while changing the directory as mv takes care of that.
- Remove the file/directory
  - rm <fileName>
  - rm -r Receipts/
    - to remove the directory

### Create and manage hard links

- Things that needs to be understand
  - Inodes
    - Filesystems in linux like XFS, Ext4 and others keeps track of data with the help of some number that is called Inode.
    - Any file might have blocks of data scattered all over the disk. This Inode remembers where all the pieces are stored.
    - Each file and directory has it's own Inode number.
    - This Inode number also keeps track of metadata, things like Permissions, Last access time, file owner etc
    - The **stat** command helps us to find out this data.
    - stat
      - stat hello.txt
  - Hard Link
    - Why we use **Hard Link**?
    - Hard Link is useful when we want to share the data between two users.
    - In this case, we do not need to copy the data again.
    - File will be accessible through Inode number.
    - Even if one user deleted the file, it will remain at the second user unless both users wants to delete the file.
    - Links are shown when we execute stat command following the name of file. For example:
      - stat hello.txt
    - Command to create the Hard link
      - ln <path-to-target-file> <path-to-link-file>
      - ln /home/abdullah/hello.txt /home/ahmed/hello.txt
        - it might give "permission denied" error. So execute the command accordingly.
    - Limitations and Considerations
      - We can only `Hard Link` the file and not the directory
      - We cannot `Hard Link` the file in other file system. For example /home/abdullah/hello.txt to /mnt/backupFiles/hello.txt
        - Because both are different file systems.
      - Make sure you have the proper permission to create the Link file at the destination. for example:
        - We need write permission at /home/ahmed/hello.txt
      - Make sure that all users involved have the write permission to the file.
        - Better to create a group
          - groupadd <group-name>
        - Make all users involved part of that group
          - usermod -aG <group-name> <users>
        - Assign 660 permission to the file
          - chmod 660 <file>

## Some essentials

- Console
- Virtual Terminals
- Terminal Emulator -> Use terminal in linux GUI.

### Some essential commands in linux

- ip a
  - it shows the IP address of the system.
- ssh <username>@<ip_address_of_the_remote_system>
  - ssh zeeshan@192.168.0.7