#!/usr/bin/env bash

for ((i=1;i<=10;i++)); do
	files="File_$i"
	touch "$files.txt"
done

echo *.txt
