#!/bin/bash

FILE_NAME="nezha-agent_linux_amd64.zip"
URL="https://github.com/nezhahq/agent/releases/latest/download/nezha-agent_linux_amd64.zip"

if curl -s -o /dev/null -I -L -w "%{http_code}" "$URL" | grep -q '^2'; then
  echo "远程 nezha-agent_linux_amd64.zip 文件存在，准备下载"
  curl -sL -o /usr/local/src/binary/$FILE_NAME "$URL"
fi