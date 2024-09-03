#!/bin/bash

FILE_NAME="Xray-linux-64.zip"
URL="https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip"

if curl -s -o /dev/null -I -L -w "%{http_code}" "$URL" | grep -q '^2'; then
  echo "远程 $FILE_NAME 文件存在，准备下载"
  curl -sL -o ~/dist_binary/$FILE_NAME "$URL"
fi