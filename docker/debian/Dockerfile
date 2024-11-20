FROM debian:latest
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y \
    build-essential \
    cmake \
    git \
    libgnutls28-dev \
    libssl-dev \
    libcurl4-openssl-dev \
    zlib1g-dev \
    pkg-config \
    libmysqlclient-dev\
    ca-certificates && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /inspircd-build

RUN git clone --depth=1 https://github.com/inspircd/inspircd.git 

RUN cd inspircd \
    ./configure --enable-extras mysql

RUN rm -r inspircd

EXPOSE 6667 6697

WORKDIR /inspircd
COPY inspircd.conf /etc/inspircd/inspircd.conf
CMD ["bin/inspircd", "--config=conf/inspircd.conf"]

