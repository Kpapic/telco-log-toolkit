#!/bin/bash

# Check for the log file - input from user

read -p "Enter logfile: " logfile
read -p "Enter search term: " search_term
read -p "Enter number of lines: " row_number
if [ -z "$logfile" ]
then
	echo "Usage: ./analyze.sh <logfile> <search_term> <row_number>"
	exit
fi

# Check for search term

if [ -z "$search_term" ]
then
	echo "Usage: ./analyze.sh <logfile> <search_term> <row_number>"
	exit
fi

# Check the number of lines

if [ -z "$row_number" ]
then
	echo "Usage: ./analyze.sh <logfile> <search_term> <number_of_lines>"
	exit
fi

#Check if 3rd argument is a number

if ! [[ "$row_number" =~ ^[0-9]+$ ]]
then
	echo "Error: number_of_lines must be a number."
	exit
fi

# Check is there a file

if [ ! -f "$logfile" ]
then
	echo "Error: File $logfile not found."
	exit
fi

# Check is file is empty

if [ ! -s "$logfile" ]
then
	echo "Error: File $logfile is empty."
	exit
fi

# Report name
echo "=== Log analysis ==="

# Which file we are analysing
echo "Log file: $logfile"

# Show search term
echo "Search term: $search_term"

# Number of findings
echo "Findings: $( grep "$search_term" "$logfile" | wc -l)"

echo

# Print last N rows
echo "Last $row_number matches:"

grep "$search_term" "$logfile" | tail -$row_number
