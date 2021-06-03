#! /usr/bin/awk -f

## BEGIN STATEMENT
BEGIN {
	print "square dari ",$1," adalah ",sqrt($1)
}

