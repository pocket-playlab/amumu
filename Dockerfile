FROM debian:jessie

ENV GOROOT /goroot
ENV GOPATH /gopath
ENV PATH $PATH:$GOROOT/bin:$GOPATH/bin
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv 7F0CEB10 && echo "deb http://repo.mongodb.org/apt/debian wheezy/mongodb-org/3.0 main" | tee /etc/apt/sources.list.d/mongodb-org-3.0.list
RUN apt-get update && apt-get upgrade -y && \
RUN apt-get install -y \
    curl \
    build-essential \
    ca-certificates \
    git \
    mercurial \
    bzr \
    apt-utils\
    postgresql-client \
    mysql-client \
    vim \
    redis-tools \
    mongodb-org-shell \
    mongodb-org-tools

RUN mkdir /goroot && curl https://storage.googleapis.com/golang/go1.4.2.linux-amd64.tar.gz | tar xvzf - -C /goroot --strip-components=1
RUN mkdir /gopath

RUN go get github.com/rakyll/boom

CMD ["bash"]
