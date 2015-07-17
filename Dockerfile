FROM google/golang

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y \
    apt-utils\
    postgresql-client \
    mysql-client \
    vim \
    redis-tools

RUN go get github.com/rakyll/boom

CMD ["bash"]
