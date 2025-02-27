#!/bin/bash

FILE_NAME="ttyd.x86_64"
URL="https://github.com/tsl0922/ttyd/releases/latest/download/ttyd.x86_64"

if curl -s -o /dev/null -I -L -w "%{http_code}" "$URL" | grep -q '^2'; then
  echo "远程 $FILE_NAME 文件存在，准备下载"
  curl -sL -o ~/dist_binary/$FILE_NAME "$URL"
fi