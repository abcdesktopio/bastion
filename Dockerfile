
FROM ubuntu:latest

RUN apt update && apt install -y openssh-server openssh-client --no-install-recommends \
 && apt clean && rm -rf /var/lib/apt/lists/*


RUN mkdir /var/run/sshd

RUN useradd -m user

COPY files /

RUN chown -R user:user /home/user/.ssh \
 && chmod 700 /home/user/.ssh \
 && chmod 600 /home/user/.ssh/authorized_keys \
 && chmod 755 /home/user

RUN echo "PasswordAuthentication no" >> /etc/ssh/sshd_config \
 && echo "PubkeyAuthentication yes" >> /etc/ssh/sshd_config

EXPOSE 22


CMD  ["/start.sh"]
