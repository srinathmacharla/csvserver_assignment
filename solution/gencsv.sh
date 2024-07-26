#!/bin/bash

start_index=$1
end_index=$2
output_file="inputFile"

> $output_file

for ((i=start_index; i<=end_index; i++)); do
  echo "$i, $((RANDOM % 100))" >> $output_file
done
