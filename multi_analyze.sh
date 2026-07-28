#!/bin/bash

show_header () {
echo "=== Multi Log Analysis ==="
echo "Generated: $timestamp"
echo
}


timestamp=$(date)

# Asking user to define the search term

read -p "Please enter search term: " search_term
echo "Searching for $search_term ..."

echo
total=0
show_header

for file in *.log
do 
count=$(grep "$search_term" "$file" | wc -l)
total=$((total + count))
echo "$file" "$count"
done

echo
echo "Total matches: $total"
