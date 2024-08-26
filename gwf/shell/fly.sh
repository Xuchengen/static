#!/bin/sh

# 安装必要软件包
apk add bash openssh htop tzdata

# 设置中国时区
cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
echo "Asia/Shanghai" > /etc/timezone

# 创建.ssh目录
mkdir /root/.ssh

# 写入密钥
echo $TEST > /root/.ssh/id_ed25519

# 设置git全局邮箱
git config --global user.email "$GITHUB_EMAIL"

# 设置Github私钥文件权限
chmod 600 /root/.ssh/id_ed25519

# 进入root目录
cd /root

# 克隆代码
GIT_SSH_COMMAND="ssh -o StrictHostKeyChecking=no" git clone -b $GITHUB_REPOSITORY_BRANCH $GITHUB_REPOSITORY

# 启动哪吒agent
#chmod 755 /root/northflank/nezha/nezha-agent
#chmod 755 /root/northflank/nezha/nezha-agent.sh
#/root/northflank/nezha/nezha-agent.sh &

# 启动赛博佛祖
#chmod 755 /root/northflank/cloudflare/cloudflared
#chmod 755 /root/northflank/cloudflare/cloudflared.sh
#/root/northflank/cloudflare/cloudflared.sh &

# 启动ttyd
#chmod 755 /root/northflank/ttyd/ttyd
#chmod 755 /root/northflank/ttyd/ttyd.sh
#/root/northflank/ttyd/ttyd.sh &

# 启动xray
#chmod 755 /root/northflank/xray/xray
#chmod 755 /root/northflank/xray/xray.sh
#/root/northflank/xray/xray.sh &

# 启动clash
#chmod 755 /root/northflank/clash/clash
#chmod 755 /root/northflank/clash/clash.sh
#/root/northflank/clash/clash.sh &

# 启动frpc
#chmod 755 /root/northflank/frp/frpc
#chmod 755 /root/northflank/frp/frpc.sh
#/root/northflank/frp/frpc.sh &

tail -f /dev/null
