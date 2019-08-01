# Ubuntu16

## -1. 下载
```
git clone https://github.com/tz1006/Ubuntu16.git  /opt/Ubuntu16
cd /opt/Ubuntu16
bash /opt/Ubuntu16/install.sh
```
## 0. init.sh
`bash init.sh`
- 安装
  - `wget` `git`
- ufw
  - 默认端口　`22` `52`
- python3
  - `requests`
- letsencrypt
  - 证书路径　`/etc/letsencrypt/live/example.com/`
- nginx!
  - 根目录　`/home/www`
- shadowsocks
  - 端口　`2333`
  - 启动　`ssserver -c /etc/shadowsocks.conf -d start`
- vnc
  - 启动　`vncserver`
