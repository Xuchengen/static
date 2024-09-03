#!/bin/bash

VERSION=`curl -s "https://api.github.com/repos/MetaCubeX/mihomo/releases/latest" | grep -oP '"tag_name": "\K[^"]*'`
FILE_NAME="mihomo-linux-amd64.gz"
V_FILE_NAME="mihomo-linux-amd64-$VERSION.gz"
URL="https://github.com/MetaCubeX/mihomo/releases/latest/download/$V_FILE_NAME"

if curl -s -o /dev/null -I -L -w "%{http_code}" "$URL" | grep -q '^2'; then
  echo "远程 $FILE_NAME 文件存在，准备下载"
  curl -sL -o ~/dist_binary/$FILE_NAME "$URL"
fi