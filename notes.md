# LFCS (Linux Foundation Certified System Administrator) Notes

## Essential commands

## Login to Linux

- local with text-mode
- local with gui
- remote with text-mode -> console -> works with ssh
- remote with gui -> works with VNC or Remote desktop

## SSH

- SSH -> Secure shell
- telnet -> not secured method to connect to as it does not encrypt anything on same network.
- SSH daemon -> It's a program that runs in the background on the server running linux os.
  - this ssh daemon runs on server
  - this ssh daemon listens on incoming connection from client computer.
  - to be able to connect to this ssh daemon (on server), we need something called "SSH client"
- SSH client
  - This client will run on our local laptop/desktop

## Read, and use system documentation

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

## Create, Delete, Copy and Move Files and Directories

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
  - Complete path of file or directory
    - /home/zeeshan/scripts/script.sh
- What is a relative path?
  - Which is refer to as short path
  - ../../script.sh
- Listing files and directories
  - ls
  - ls -a
    - -a comes from the word all
  - ls -l
    - list files and directories in long listing format
  - ls -al
  - ls -h
    - shows size in human readable format like bytes, kilobytes and mega bytes
    - ls -alh
- Copy files/directories
  - cp -r -> recursive
  - cp -r [source] [destination]
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

## Some essentials

- Console
- Virtual Terminals
- Terminal Emulator -> Use terminal in linux GUI.

### Some essential commands in linux

- ip a
  - it shows the IP address of the system.
- ssh <username>@<ip_address_of_the_remote_system>
  - ssh zeeshan@192.168.0.7