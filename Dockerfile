FROM docker.mikush.in/printing-kiosk

COPY . /printing-kiosk
WORKDIR /printing-kiosk

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install --no-install-recommends -y cmake gcc make libc6-dev

RUN mkdir build && cd build && cmake .. && make && make install

RUN apt-get purge -y cmake gcc make libc6-dev
RUN apt clean
