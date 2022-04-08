# centos-systemd-sshd-devcontainer

#### 介绍
centos 的开发容器，支持ssh，可以使用idea ssh远程连接

#### 软件架构
软件架构说明



#### 使用说明

1. 构建自己的容器：docker build -t xxx/xxx:xxx
2. 运行容器：docker run --rm -d --privileged -p 8822:22 xxx/xxx:xxx
3. 使用ssh 登陆：ssh root@127.0.0.1 -p 8822
4. 密码：123456，如果线上环境使用，需要将密码改掉

#### 参与贡献

1.  Fork 本仓库
2.  新建 Feat_xxx 分支
3.  提交代码
4.  新建 Pull Request

