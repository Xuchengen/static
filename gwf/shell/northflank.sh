#!/bin/sh

# 安装openssh
apk add openssh

# 变更文件权限
chmod 600 /root/.ssh/id_ed25519
chmod 644 /root/.ssh/id_ed25519.pub

# 设置git全局邮箱
git config --global user.email "$GITHUB_EMAIL"

# 进入root目录
cd /root

# 克隆代码
yes | head -n 1 | git clone -b us git@github.com:Xuchengen/northflank.git

# 启动哪吒agent
/root/northflank/nezha/nezha-agent.sh &

tail -f /dev/null
