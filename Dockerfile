FROM ubuntu:17.04

RUN apt-get -y update && apt-get -y install openssh-server git

# Setting openssh
RUN mkdir /var/run/sshd
RUN sed -i "s/#PasswordAuthentication yes/PasswordAuthentication no/" /etc/ssh/sshd_config
RUN echo "AllowUsers git" >> /etc/ssh/sshd_config

# Adding git user
RUN adduser git --disabled-password --gecos ""

RUN mkdir /home/git/.ssh

EXPOSE 22

VOLUME /data

CMD ["/usr/sbin/sshd", "-D"]
