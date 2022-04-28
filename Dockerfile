FROM centos/systemd

LABEL maintainer="peiminmin"

ENV ssh_port=22 PATH=$PATH:/usr/local/go/bin:/root/.cargo/bin

RUN sed -e 's|^mirrorlist=|#mirrorlist=|g' \
         -e 's|^#baseurl=http://mirror.centos.org|baseurl=https://mirrors.tuna.tsinghua.edu.cn|g' \
         -i.bak \
         /etc/yum.repos.d/CentOS-*.repo

# install ssh server and configure
RUN yum groupinstall -y "Development Tools" && yum install -y openssh-server sudo && yum install -y wget &&\
# setup sshd, install sudo
    echo "RSAAuthentication yes" >> /etc/ssh/sshd_config && \
    echo "PubkeyAuthentication yes" >> /etc/ssh/sshd_config && \
    echo "PermitRootLogin yes" >> /etc/ssh/sshd_config && \
    echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config && \
    systemctl enable sshd.service && \
    yum clean all && \
    rm -rf /var/cache/yum

RUN wget https://golang.google.cn/dl/go1.18.1.linux-amd64.tar.gz &&  tar -C /usr/local -xzf go1.18.1.linux-amd64.tar.gz && rm -rf go1.18.1.linux-amd64.tar.gz

RUN curl -sSf https://sh.rustup.rs | bash -s -- -y


RUN chpasswd && echo 'root:123456' | chpasswd 

# expose ssh port, defaults to 22

EXPOSE ${ssh_port:-22}

CMD ["/sbin/init"]