#!/bin/bash

# Create a border with X pixels width and a gradient (currently hardcoded) around $1, output to $2. 
BORDERWIDTH=5
WIDTH=$(identify -format '%w' "$1")
HEIGHT=$(identify -format '%h' "$1")
NEWWIDTH=$(($WIDTH+$BORDERWIDTH))
NEWHEIGHT=$(($HEIGHT+$BORDERWIDTH))
TMPFILE=`mktemp`
mv $TMPFILE $TMPFILE.jpg
TMPFILE=$TMPFILE".jpg"
magick -size "$NEWWIDTH"x"$NEWHEIGHT" gradient:'#14315B'-'#64A4FF' $TMPFILE
composite "$1" $TMPFILE  -gravity center $2 
