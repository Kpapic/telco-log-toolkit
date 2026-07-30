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
echo "Most matches found in: $top_log ($max_count)"
echo "Logs with matches= $log_match"
}

timestamp=$(date)


# Asking user to define the search term

read -p "Please enter search term: " search_term
echo "Searching for $search_term ..."

echo
total=0
log_count=0

max_count=0
top_log=""
log_match=0

show_header

for file in *.log
do 
count=$(grep "$search_term" "$file" | wc -l)
total=$((total + count))

log_count=$((log_count + 1))

if ((count > max_count))
then max_count=$count
    top_log=$file
fi

if ((count > 0))
then
    log_match=$((log_match + 1))
    
fi
echo "$file $count"
done
echo
show_summary
