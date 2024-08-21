#!/bin/sh

chmod 600 /root/.ssh/id_rsa
chmod 644 /root/.ssh/id_rsa.pub

# 安装openssh
apk add openssh

# 启动哪吒agent
# /root/northflank/nezha/nezha-agent.sh &

tail -f /dev/null
