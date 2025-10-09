#!/bin/bash
<<<<<<< HEAD

# Usage: $0 <percentage_to_check>
count=0
found=0

while read line; do
	((count++))

	[[ $count -eq 1 ]] && continue

	DISK_NAME="$(echo "$line" | awk '{print $1}')"
	TOTAL_SIZE="$(echo "$line" | awk '{print $2}')"
	AVAILABLE_SIZE="$(echo "$line" | awk '{print $3')"
	USED_SIZE="$(echo "$line" | awk '{print $4')"
	USE_PERCENTAGE="$(echo "$line" | awk '{print $5}' | sed 's/%//g')"

	if [[ $USE_PERCENTAGE -gt $1 ]]; then
		found=1
		echo "Alert: $DISK_NAME usage is above ${1}% (${USE_PERCENTAGE}%)"
		echo "  TOTAL: $TOTAL_SIZE"
		echo "  USER:  $USED_SIZE"
	if
done <<< "$(df -h)

if [[ $found -eq 0 ]]; then
	echo "   ALL DISK USAGE IS LESS THAN 80%"
fi
=======
for percent in $(df | sed '1d' | awk '{print $(NF-1)}' | sed 's/%//g'); do
  echo "percent"
done
>>>>>>> 63faf5fc6991dc512e6ccbfd6ea62751a154d1aa
