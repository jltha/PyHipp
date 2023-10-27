#!/bin/bash

echo "Number of hkl files"
find . -name "*.hkl" | grep -v -e spiketrain -e mountains | wc -l

echo "Number of mda files"
find mountains -name "firings.mda" | wc -l

echo
echo "#==========================================================="
echo "Start Times"

files=(*.out)
file_count=${#files[@]}

for ((i = 0; i < file_count; i++)); do
  echo "==> ${files[i]}  <=="
  head -n 1 "${files[i]}"

  if [ $i -lt $((file_count - 1)) ]; then
    echo
  fi
done

echo "End Times"

for ((i = 0; i < file_count; i++)); do
  echo "==> ${files[i]} <=="
  tail -n 5 "${files[i]}"

  if [ $i -ne $((file_count - 1)) ]; then
    echo
  fi
done

echo "#==========================================================="
