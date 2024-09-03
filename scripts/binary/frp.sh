#!/bin/bash

FILE_NAME="frp_linux_amd64.tar.gz"
URL="https://github.com/fatedier/frp/releases/download/v0.51.3/frp_0.51.3_linux_amd64.tar.gz"

if curl -s -o /dev/null -I -L -w "%{http_code}" "$URL" | grep -q '^2'; then
  echo "远程 $FILE_NAME 文件存在，准备下载"
  curl -sL -o ~/dist_binary/$FILE_NAME "$URL"
fi