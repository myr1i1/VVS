#!/usr/bin/env bash

echo "Cleaning empty files..."

my_dir="$HOME/Desktop/SUPER_BOMBA_TASK/broken_project/data"


if [[ ! -d "$my_dir" ]]; then
	echo "Error: directory $my_dir  doesn't exist"
	exit 1
fi



cd "$my_dir" || {
	echo "Error: cannot change directory to $my_dir"
	exit 1
}


removed=0


for file in *.txt; do
  if [[ !  -s "$file" ]]; then
    echo "Removing $file"
    rm "$file"
    (($removed++))
  fi
done

	echo "Done. Empty $removed .txt files were removed."
