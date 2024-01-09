#!/bin/bash

# Set the ALL variable to false on standard
ALL=false

# Usage function called will explain how to use the script and what OPTARGs mean
usage() {
  echo "Usage: ${0} [-a] [-t TIME]" >&2
  echo '-a Display all tasks'
  echo '-t Display task listed in YYYY-MM-DD format or none'
  # Exit code of 1 to stop script here
  exit 1
}

# getopts is used to parse command line options 
while getopts :at: OPTION; do
  case ${OPTION} in
    a) 
     ALL='true'
     ;;
    # Taking TIME which is the date in YYYY-MM-DD format to search or none. 
    t) 
     TIME="${OPTARG}"
     ;;
    ?)
     usage
     ;;
  esac
done

# Check if the ALL tag is set to true
if [ "${ALL}" = 'true' ]; then
  cat tasklisting
  # Successfully gotten through the script, end program with exit code 0
  exit 0
fi

# If TIME field is blank which is different from none for due date
if [[ -z "${TIME}" ]]; then
  # Print an error message to the user 
  echo "You need to put in a date in the format YYYY-MM-DD or none"
  # Stop the script with error code 1.
  exit 1
fi

# Otherwise you will look for the string pattern using the time that is given by user
grep -n " Due_date: ${TIME} " tasklisting


# Exit code 0 stating that succesful completion of the script is done. 
exit 0

