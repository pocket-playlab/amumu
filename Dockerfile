FROM debian:jessie

ENV GOROOT /goroot
ENV GOPATH /gopath
ENV PATH $PATH:$GOROOT/bin:$GOPATH/bin

RUN apt-get update && apt-get upgrade -y
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
    redis-tools

RUN mkdir /goroot && curl https://storage.googleapis.com/golang/go1.2.2.linux-amd64.tar.gz | tar xvzf - -C /goroot --strip-components=1
RUN mkdir /gopath

RUN go get github.com/rakyll/boom

CMD ["bash"]
