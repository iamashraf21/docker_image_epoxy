FROM ubuntu:latest

FROM python:3

RUN apt-get update && \
      apt-get -y install sudo
RUN apt-get install curl
RUN useradd -ms '/bin/bash' docker && echo "docker:docker" | chpasswd && adduser docker sudo

RUN useradd -ms '/bin/bash' docker2 && echo "docker2:docker2" | chpasswd && adduser docker2 sudo

RUN curl -fsSL https://raw.githubusercontent.com/arduino/arduino-cli/master/install.sh | sh

RUN echo "# arduino-cli.yaml \n\
board_manager: \n\
  additional_urls: \n\
    - https://lowpowerlab.github.io/MoteinoCore/package_LowPowerLab_index.json" > arduino-cli.yaml

RUN arduino-cli core update-index
RUN usermod -a -G dialout docker
USER docker
RUN chown -R docker /home/docker
WORKDIR /home/docker

RUN python -m pip install pyserial
RUN python -m pip install xmlformatter
RUN python -m pip install ecdsa

RUN arduino-cli core install Moteino:samd

RUN getent passwd 1001

