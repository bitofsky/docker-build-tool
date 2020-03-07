# Get AWS CLI v2 > curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && unzip awscliv2.zip
# Get kubectl > curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
# for now can not use awscli v2 in alpine linux
# refer : https://github.com/aws/aws-cli/issues/4685 

FROM docker:19.03-dind

WORKDIR /tool

# awscli v2 install
# COPY aws ./aws
# RUN ./aws/install

# awscli v1 install
ENV AWSCLI_VERSION "1.18.16"
RUN apk -v --no-cache --update add \
    python \
    py-pip \
    groff \
    less \
    mailcap \
    && \
    pip --no-cache-dir install --upgrade awscli==${AWSCLI_VERSION} && \
    apk -v --purge del py-pip && \
    rm -rf /var/cache/apk/*

ADD bin/* /usr/local/bin/
RUN chmod 755 /usr/local/bin/*

CMD /bin/sh
