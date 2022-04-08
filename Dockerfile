FROM centos/systemd

# ssh, systemd, passwordless sudo container for ansible target use etc

LABEL maintainer="peiminmin"

ENV ssh_port=22

# install ssh server and configure

RUN yum install -y openssh-server sudo && \
# setup sshd, install sudo
    echo "RSAAuthentication yes" >> /etc/ssh/sshd_config && \
    echo "PubkeyAuthentication yes" >> /etc/ssh/sshd_config && \
    echo "PermitRootLogin yes" >> /etc/ssh/sshd_config && \
    echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config && \
    systemctl enable sshd.service && \
# clean up
    yum clean all && \
    rm -rf /var/cache/yum
# use tsinghua centos mirrors
RUN sudo sed -e 's|^mirrorlist=|#mirrorlist=|g' \
         -e 's|^#baseurl=http://mirror.centos.org|baseurl=https://mirrors.tuna.tsinghua.edu.cn|g' \
         -i.bak \
         /etc/yum.repos.d/CentOS-*.repo

RUN chpasswd && echo 'root:123456' | chpasswd

# expose ssh port, defaults to 22

EXPOSE ${ssh_port:-22}

CMD ["/sbin/init"]