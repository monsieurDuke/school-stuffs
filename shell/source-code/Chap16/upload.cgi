#!/bin/bash

function readfiles
{
  read disposition data name filename
  read ct contenttype
  read blankline
  read previous_line
  eval `echo $filename | tr -d ''`
  echo "<hr/>"
  echo "Processing file \"$filename\" ($contenttype)<br/>"
  > uploads/$filename

  while read content
  do
    contentvalue=${content%}
    case $contentvalue in
      $boundary)
	# end of file.
	# First, show the summary of the previous file
	cd uploads
	md5sum $filename
	cd - > /dev/null
	echo "<br/>"
        # Now read in the headers of the next file
  	read disposition data name filename
  	read ct contenttype
  	read blankline
  	read previous_line
  	eval `echo $filename | tr -d ''`
        if [ ! -z "$filename" ]; then
	  echo "<hr/>"
	  echo "Processing file \"$filename\" ($contenttype)<br/>"
          > uploads/$filename
	else
          # That was the end of the input. No proper notification
	  # received (boundary--) but handle it gracefully.
	  echo "<hr/>"
	  return
	fi
	;;

      ${boundary}--)
        # end of all input
	cd uploads
	md5sum $filename
	cd - > /dev/null
	echo "<hr/>"
	return
	;;

      *)
 	echo "$previous_line" >> uploads/$filename # | tee -a uploads/$filename
	previous_line=$content
	;;
    esac
  done
}

# Show the Header
cat - << EndOfHeaders
Content-type: text/html

<html>
<head><title>Uploader</title></head>
<body>
<h1>File Uploads</h1>
EndOfHeaders

echo "Query String is $QUERY_STRING"

# Read the first line of input. This tells you the boundary
read BOUNDARY
boundary=${BOUNDARY%}

# Read and process the input
readfiles

# Use this instead for debugging and testing
# echo "<pre>"
# cat -
# echo "</pre>"

# Write the HTML footer
cat - << EOF
</body>
</html>
EOF
