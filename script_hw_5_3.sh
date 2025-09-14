#!/bin/bash

file_name=$1
new_ext=$2
file_path=$(find . -name "$file_name" -type f | head -n 1)
filename_only=$(basename "$file_path")
# Проверяем файл на расширение
if [[ "$filename_only" == *.* ]] && [[ "$filename_only" != .* ]] || 
   [[ "$filename_only" =~ \..+\. ]]; then
    new_path="${file_path%.*}.$new_ext"
else
    new_path="$file_path.$new_ext"
fi
mv -v "$file_path" "$new_path"