#!/bin/bash

# 取得當前腳本目錄的絕對路徑
current="$(cd "$(dirname "$0")" && pwd)"
echo "當前目錄: $current"

# 遍歷$current/build目錄下的所有.hex文件
for file in "$current/build"/*.hex; do
    echo "完整路徑: $file"

    # 取得文件所在目錄
    directory=$(dirname "$file")
    echo "目錄: $directory"

    # 取得文件名（不包括擴展名）
    filename=$(basename -s .hex "$file")
    echo "文件名: $filename"

    # 複製文件到當前目錄
    cp "$file" "$current/"

    # 執行hex2dfu工具進行轉換
    "$current/hex2dfu/hex2dfu.exe" -t "$filename.hex" "$filename.dfu"

    # 複製生成的.dfu文件到$current/build目錄
    cp "$filename.dfu" "$current/build/"

    # 刪除原始的.hex和生成的.dfu文件
    rm -f "$filename.hex" "$filename.dfu"
done
