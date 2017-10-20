FROM debian:stretch

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get -yqq update && apt-get -yqq --no-install-recommends install \
    build-essential \
    ca-certificates \
    cmake \
    cmake-data \
    git \
    i3-wm \
    libasound2-dev \
    libcairo2-dev \
    libcurl4-openssl-dev \
    libiw-dev \
    libmpdclient-dev \
    libxcb-ewmh-dev \
    libxcb-icccm4-dev \
    libxcb-image0-dev \
    libxcb-randr0-dev \
    libxcb-util0-dev \
    libxcb-xkb-dev \
    libxcb-xrm-dev \
    libxcb1-dev \
    pkg-config \
    python-xcbgen \
    xcb-proto \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /tmp
ADD . .

CMD ["sh", "./build.sh"]
