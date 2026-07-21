#!/bin/bash

# Check for the log file - argument

if [ -z "$1" ]
then
	echo "Usage: ./analyze.sh <logfile> <search_term> <number_of_lines>"
	exit
fi

# Check for search term

if [ -z "$2" ]
then
	echo "Usage: ./analyze.sh <logfile> <search_term> <number_of_lines>"
	exit
fi

# Check the number of lines

if [ -z "$3" ]
then
	echo "Usage: ./analyze.sh <logfile> <search_term> <number_of_lines>"
	exit
fi

#Check if 3rd argument is a number

if ! [[ "$3" =~ ^[0-9]+$ ]]
then
	echo "Error: number_of_lines must be a number."
	exit
fi

# Check is there a file

if [ ! -f "$1" ]
then
	echo "Error: File $1 not found."
	exit
fi

# Check is file is empty

if [ ! -s "$1" ]
then
	echo "Error: File $1 not found."
	exit
fi

# Report name
echo "=== Log analysis ==="

# Which file we are analysing
echo "Log file: $1"

# Show search term
echo "Search term: $2"

# Number of findings
echo "Findings: $( grep "$2" "$1" | wc -l)"

echo

# Print last N rows
echo "Last $3 matches:"

grep "$2" "$1" | tail -$3
