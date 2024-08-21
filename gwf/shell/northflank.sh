#!/bin/sh

# 安装openssh
apk add openssh

# 变更文件权限
chmod 600 /root/.ssh/id_ed25519
chmod 644 /root/.ssh/id_ed25519.pub

# 禁用主机密钥检查
GIT_SSH_COMMAND="ssh -o StrictHostKeyChecking=no"

# 设置git全局邮箱
git config --global user.email "$GITHUB_EMAIL"

# 进入root目录
cd /root

# 克隆代码
GIT_SSH_COMMAND="ssh -o StrictHostKeyChecking=no" git clone -b us git@github.com:Xuchengen/northflank.git

# 启动哪吒agent
/root/northflank/nezha/nezha-agent.sh &

tail -f /dev/null
