FROM ubuntu:focal-20220531
RUN apt update
RUN apt install -y cmake
RUN apt install -y build-essential
RUN apt install -y make python3
RUN apt install -y pip
RUN pip install numpy

WORKDIR /