
FROM ubuntu:latest

RUN apt update && apt install -y openssh-server openssh-client --no-install-recommends \
 && apt clean && rm -rf /var/lib/apt/lists/*


RUN mkdir /var/run/sshd

RUN useradd -m user

COPY files /

EXPOSE 22


CMD  ["/start.sh"]
