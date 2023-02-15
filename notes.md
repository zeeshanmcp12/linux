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

## Some essentials

- Console
- Virtual Terminals
- Terminal Emulator -> Use terminal in linux GUI.

### Some essential commands in linux

- ip a
  - it shows the IP address of the system.
- ssh <username>@<ip_address_of_the_remote_system>
  - ssh zeeshan@192.168.0.7