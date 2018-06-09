#!/bin/bash

# Program to print a text file with headers and footers

# Usage: printfile file

# Create a temporary file name that gives preference
# to the user's local tmp directory and has a name
# that is resistant to "temp race attacks"

# use either user directory's tmp directory or the one in root
if [ -d "~/tmp" ]; then
	TEMP_DIR=~/tmp
else
	TEMP_DIR=/tmp
fi

# create temp file
TEMP_FILE=$TEMP_DIR/printfile.$$.$RANDOM

# save print file
PROGNAME=$(basename $0)

# --------------
# usage function
# --------------
usage() {

	# Display usage message on standard error
	echo "Usage: $PROGNAME file" 1>&2
}

# -----------------
# clean up function
# -----------------
clean_up() {

	# Perform program exit housekeeping
	# Optionally accepts an exit status
	rm -f $TEMP_FILE
	exit $1
}

# -------------------
# error exit function
# -------------------
error_exit() {

	# Display error message and exit
	echo "${PROGNAME}: ${1:-"Unknown Error"}" 1>&2
	clean_up 1
}

# call clean_up function for certain signals
trap clean_up SIGHUP SIGINT SIGTERM

# if only one parameter given, print usage info
if [ $# != "1" ]; then
	usage
	error_exit "one file to print must be specified"
fi

# if parameter is not a file, print file error
if [ ! -f "$1" ]; then
	error_exit "file $1 cannot be read"
fi

# copy file to temporary file
pr $1 > $TEMP_FILE || error_exit "cannot format file"

# ask user if she wants to print the file
echo -n "Print file? [y/n]: "
read

# if reply is yes, print the file (here we use less instead of lpr)
if [ "$REPLY" = "y" ]; then
	less $TEMP_FILE || error_exit "cannot print file"
fi
clean_up