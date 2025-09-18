#!/bin/bash
for percent in $(df | sed '1d' | awk '{print $(NF-1)}' | sed 's/%//g'); do
  echo "percent"
done
