# A better way

if cd 'images'; then
	echo "Could change directoy" 1>&2
else
	echo "Could not change directory! Aborting." 1>&2
	exit 1
fi