#!/bin/sh

# 安装必要软件包
apk add bash openssh htop tzdata

# 设置中国时区
cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
echo "Asia/Shanghai" > /etc/timezone

# 设置git全局邮箱
git config --global user.email "$GITHUB_EMAIL"

# 设置Github私钥文件权限
chmod 600 /root/.ssh/id_ed25519
chmod 644 /root/.ssh/id_ed25519.pub

# 进入root目录
cd /root

# 克隆代码
GIT_SSH_COMMAND="ssh -o StrictHostKeyChecking=no" git clone -b $GITHUB_REPOSITORY_BRANCH $GITHUB_REPOSITORY

# 启动哪吒agent
/root/northflank/nezha/nezha-agent.sh &

# 启动赛博佛祖
/root/northflank/cloudflare/cloudflared.sh &

# 启动ttyd
/root/northflank/ttyd/ttyd.sh &

# 启动xray
/root/northflank/xray/xray.sh &

tail -f /dev/null
