#!/bin/bash

/bin/cat email_list | 
while read WHO WHAT SUBJ; do
  /usr/bin/mail -s "$SUBJ" $WHO < $WHAT
  echo $WHO
done
