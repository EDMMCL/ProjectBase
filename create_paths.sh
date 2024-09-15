#!/bin/bash

# 指定包含路径的文本文件
file="paths.txt"

# 检查文件是否存在
if [ ! -f "$file" ]; then
    echo "文件 $file 不存在."
    exit 1
fi

# 读取文件中的每一行
while IFS= read -r line
do
    # 去除路径前的 ./ ，如果存在
    line=${line#./}
    
    # 检查路径是否已经存在
    if [ -e "$line" ]; then
        echo "路径 $line 已存在."
    else
        # 检查是否以点（.）结尾，如果是则创建文件，否则创建文件夹
        if [[ "$line" == *.* ]]; then
            # 创建文件的父目录
            mkdir -p "$(dirname "$line")"
            # 创建文件
            touch "$line"
            echo "已创建文件 $line."
        else
            # 创建文件夹
            mkdir -p "$line"
            echo "已创建文件夹 $line."
        fi
    fi
done < "$file"