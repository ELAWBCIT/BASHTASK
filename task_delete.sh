#!/bin/bash

# Delete tasks based on id

# Usage function tells how to call the script and its associated OPTARGs
usage() {
  echo "Usage: ${0} [-i ID]" >&2
  echo ' -i The ID you want of the task to be deleted'
  # exit error code of 1 to stop script here
  exit 1
}


# getopts is used to parse command line options
while getopts :i: OPTION; do
  case ${OPTION} in
    # Defining one option, which is the ID of the task 
    i) 
      ID="${OPTARG}"
      ;;
    ?) 
      usage
      ;;
  esac
done

# Checking if the ID field is blank
if [[ -z "${ID}" ]]; then
  # Print an error message for your user
  echo "You need to input an ID for deletion"
  # Stop the script with an exit error code of 1
  exit 1
fi

# Creating a variable LINE which has a value of the grep -n line search 
# Search is done by looking for the ID 
LINE=$(grep -n "\<ID: ${ID}\>" tasklisting)
# Letting the user know that the line will be deleted
echo "${LINE} IS NOW DELETED"

# using sed with a regex of the ID string pattern to delete the task line from the tasklisting file
sed -i "/\<ID: ${ID}\>/d" tasklisting


# Exit with error code 0 to show succesful completion.
exit 0
