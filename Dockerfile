# Get AWS CLI v2 > curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && unzip awscliv2.zip
# Get kubectl > curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
# Get Docker > curl "https://download.docker.com/linux/static/stable/x86_64/docker-19.03.7.tgz" -o "docker.tgz"

FROM ubuntu:18.04

WORKDIR /tool

# awscli v2 install
COPY aws ./aws
RUN ./aws/install

ADD bin/* /usr/local/bin/
RUN chmod 755 /usr/local/bin/*

# docker install
RUN apt-get update \
    && apt-get install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common \
    && curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - \
    && add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" \
    && apt-get update \
    && apt-get install -y docker-ce docker-ce-cli

CMD /bin/bash
