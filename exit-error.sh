error_exit()
{
	echo "$1" 1>&2
	exit 1
}

# Using error_exit

if cd 'images-2'; then
	echo "directoy found"
else
	error_exit "Cannot change directory!  Aborting."
fi