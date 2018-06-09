#!/bin/bash

# make_page - A script to produce an HTML file

TITLE="System Information for $HOSTNAME"
RIGHT_NOW=$(date +"%x %r %Z")
TIME_STAMP="Updated on $RIGHT_NOW by $USER"

cat <<- _EOF_
    <HTML>
    <HEAD>
        <TITLE>
        $TITLE
        </TITLE>
    </HEAD>

    <BODY>
    <H1>$TITLE</H1>
    <P>$TIME_STAMP
    </BODY>
    </HTML>
_EOF_
