#!/bin/bash

show_header () {
echo "=== Multi Log Analysis ==="
echo "Generated: $timestamp"
echo
}

show_summary () {
echo
echo "=== Summary ==="
echo "Search term: $search_term"
echo "Processed log files: $log_count"
echo "Total matches: $total"
}

timestamp=$(date)

# Asking user to define the search term

read -p "Please enter search term: " search_term
echo "Searching for $search_term ..."

echo
total=0
log_count=0
show_header

for file in *.log
do 
count=$(grep "$search_term" "$file" | wc -l)
total=$((total + count))
echo "$file" "$count"

log_count=$((log_count + 1))
done

echo
show_summary
