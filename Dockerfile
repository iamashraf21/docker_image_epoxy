FROM ubuntu:latest

FROM python:3

RUN apt-get update && \
      apt-get -y install sudo && \
      apt-get install make
#RUN apt-get install curl
#RUN useradd -ms '/bin/bash' -u 1001 docker && echo "docker:docker" | chpasswd && adduser docker sudo

#RUN usermod -a -G dialout docker

#RUN curl -fsSL https://raw.githubusercontent.com/arduino/arduino-cli/master/install.sh | sh

#USER docker

#RUN echo "# arduino-cli.yaml \n\
#board_manager: \n\
#  additional_urls: \n\
#    - https://lowpowerlab.github.io/MoteinoCore/package_LowPowerLab_index.json" > /home/docker/arduino-cli.yaml

#RUN arduino-cli core update-index --additional-urls "https://lowpowerlab.github.io/MoteinoCore/package_LowPowerLab_index.json"
#RUN cd /home/docker && arduino-cli core update-index 
#RUN chown -R docker /home/docker
#WORKDIR /home/docker

RUN python -m pip install pyserial
RUN python -m pip install xmlformatter
#RUN python -m pip install ecdsa

#RUN arduino-cli core install Moteino:samd

#USER root

