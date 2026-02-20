#!/usr/bin/env bash

echo "Starting project..."

# source <file> позволяет использовать переменные, хранящиеся внутри него
source config.txt

echo "Mode: $MODE"
echo "Timeout: $TIMEOUT"

if [ -z "$SECRET_KEY"]; then
  echo "ERROR: SECRET_KEY is not set"
fi

echo "Loading users..."

users=("$@")

# "read" читает текст, который вы запишете "во время" работы скрипта!! по сути input
# см. reader.sh
while [[read -r user]]; do
  users+=("$user")
done < users.txt

echo "Users count: ${#users[@]}"

for u in "${users[@]}"; do
  echo "User: $u"
done

echo "Analyzing logs..."

errors=$(grep -h "ERROR" logs/*.log | wc -l)
warnings=$(grep -h "WARNING" logs/*.log | wc -l)

echo "Errors: $errors"
echo "Warnings: $warnings"

echo "Processing data files..."

txt_files=(data/*.txt)

echo "Found files: ${#txt_files[@]}"

for f in "${txt_files[@]}"; do
  echo "File: $f"
  echo "Lines: $(wc -l < "$f")"
done

./scripts/calc.sh 5 10

./scripts/cleanup.sh

echo "Done."
