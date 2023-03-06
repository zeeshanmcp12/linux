# Linux Exercise

## Use case

Create a directory named 9 under /tmp/1/2/3/4/5/6/7/8 directory. Please note that the structure of sub-directories, from 1 to 8 does not exist. However, mkdir has a command line option to automatically create all of these sub-directories automatically in one shot, instead of 9 consecutive commands. This option is described in the help output or manual pages as make parent directories as needed. Find out what the correct option is and use it to create the directory in one shot.

## Command to solve above

- man mkdir
  - OR mkdir --help
- mkdir -p /tmp/1/2/3/4/5/6/7/8/9