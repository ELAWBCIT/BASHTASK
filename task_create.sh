#!/bin/bash

# Add a task that specifies the following
# - The task itself
# - An optional due date
# - An id
# List tasks (all and due dates)
# Delete tasks 

# This function called usage states the way the script is suppose to work
usage() {
  # States the way the script should be called with OPTARG
  echo "Usage: ${0} [-t TASK] [-d DUEDATE] [-i ID]" >&2
  # States the various OPTARGs
  echo "Create your task"
  echo " -t input your task"
  echo " -d input your duedate YYYY-MM-DD or leave it blank for none"
  echo " -i input your task ID"
  # Stop the program with exit error code 1, stops program here
  exit 1
}


# getopts is used to parse command line options
while getopts :t:d:i: OPTION; do
  case ${OPTION} in
    # denote the task that you want to have
    t) 
      TASK="${OPTARG}"
      ;;
    # denote the due date in YYYY-MM-DD format
    d)
      DUEDATE="${OPTARG}"
      ;;
    # denote the ID of the task at hand
    i)
      ID="${OPTARG}"
      ;;
    ?)
      usage
      ;;
  esac
done

# if your task is empty field
if [[ -z ${TASK} ]]; then
  # print an error message to your user
  echo "Task cannot be a blank field"
  # exit error code 1 to stop the script here
  exit 1
fi

# if your due date is an empty field
if [[ -z ${DUEDATE} ]]; then
  # set the DUEDATE variable to a "none" string
  DUEDATE="none"
fi

# if your ID is an empty field
if [[ -z ${ID} ]]; then
  # print an error message to your user
  echo "ID cannot be a blank field"
  # exit error code 1 to stop the script here
  exit 1
fi

# creating FILEWRITE variable with the file write path as value
FILEWRITE=tasklisting
# Setting up the string with information of task into value DATA
DATA="Task: ${TASK} | Due_date: ${DUEDATE} | ID: ${ID}"
# append to the file tasklisting via FILEWRITE variable
echo "${DATA}" >> "$FILEWRITE"


# Let user know task was successfully added
echo "Task added successfully"
# Show all the current tasks
# cat tasklisting


# Exit with error code 0 to show succesful completion of script 
exit 0
