#!/bin/bash

# 源文件路径
source_file="/home/sk/Downloads/pubnr_cn.txt"
# 目标文件夹路径
destination_folder="output"

# 创建目标文件夹
mkdir -p "$destination_folder"

# 设置计数器和路径变量
count=0
path="$destination_folder"

# 逐行读取源文件
while IFS= read -r line; do
  # 如果计数器达到100，创建新的文件夹并重置计数器和路径
  if (( count % 100 == 0 )); then
    folder_name=$(( count / 100 ))
    new_folder="$path/$folder_name"
    mkdir -p "$new_folder"
    path="$new_folder"
    count=0
  fi

  # 将行写入文件
  file_name=$(( count + 1 ))
  file_path="$path/$file_name.txt"
  echo "$line" > "$file_path"

  # 增加计数器
  (( count++ ))
done < "$source_file"