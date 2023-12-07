FROM debian:bullseye

# Install CircleCI dependencies
RUN apt-get update
RUN apt-get install -y git curl ssh tar gzip ca-certificates

# Install build dependencies
RUN apt-get install -y build-essential bison pkg-config libpng-dev

# Retrieve rgbds
RUN git clone https://github.com/gbdev/rgbds.git && \
  cd rgbds && \
  git fetch --tags && git checkout v0.6.0

# Build rgbds
RUN cd rgbds && make install
