#!/bin/bash

# 查找 build 目录下的所有 .dfu 文件
binary=$(find "$PWD/build" -name "*.dfu" -print -quit)

# 查找 hex2dfu 目录下的 DfuSeCommand.exe 文件
downloader=$(find "$PWD/hex2dfu" -name "DfuSeCommand.exe" -print -quit)

# 检查是否找到了 .dfu 文件和 DfuSeCommand.exe 文件
if [[ -n "$binary" ]]; then
    if [[ -n "$downloader" ]]; then
        # 显示 .dfu 文件的信息
        echo "BinFile: $binary"
        file_time=$(stat -c "%y" "$binary")
        echo "文件时间: $file_time"

        # 使用 DfuSeCommand.exe 进行下载
        "$downloader" -c --de 0 -d --v --o --fn "$binary"

        echo ""
        echo "下载完成: $(date) $(date +%T)"
        exit 0
    fi
fi

echo ""
echo "下载失败: $(date) $(date +%T)"
exit 1
