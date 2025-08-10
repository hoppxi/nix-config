#!/usr/bin/env bash

if [ -z "$1" ]; then
  echo "Usage: $0 /path/to/folder"
  exit 1
fi

folder="$1"
shopt -s globstar nullglob

extensions=("jpg" "jpeg" "png" "gif" "bmp" "tiff" "webp")

is_image() {
  local ext="${1##*.}"
  ext="${ext,,}" 
  for e in "${extensions[@]}"; do
    if [[ "$ext" == "$e" ]]; then
      return 0
    fi
  done
  return 1
}

picture_num=1

while IFS= read -r -d '' file; do
  dir=$(dirname "$file")
  ext="${file##*.}"
  ext="${ext,,}"
  
  while [[ -e "$dir/wallpaper$picture_num.$ext" ]]; do
    ((picture_num++))
  done

  new_name="$dir/wallpaper$picture_num.$ext"

  if [[ "$file" != "$new_name" ]]; then
    echo "Renaming '$file' to '$new_name'"
    mv -n "$file" "$new_name"
  fi
  ((picture_num++))
done < <(find "$folder" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.gif" -o -iname "*.bmp" -o -iname "*.tiff" -o -iname "*.webp" \) -print0)
