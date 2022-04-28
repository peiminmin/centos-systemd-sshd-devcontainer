# centos-systemd-sshd-devcontainer

#### Description
CentOS's golang trust development container supports SSH. You can use idea SSH to connect remotely. ```It can't be used in online production environment```

#### Software Architecture
Software architecture description



#### Instructions

1. build image ：docker build -t xxx/xxx:xxx
2. run container：docker run  -d --privileged -p 8822:22  -v /hostTest:/data  peiminmin/centos-systemd-sshd-devcontainer:main
3. ssh login：ssh root@127.0.0.1 -p 8822


#### Contribution

1.  Fork the repository
2.  Create Feat_xxx branch
3.  Commit your code
4.  Create Pull Request



