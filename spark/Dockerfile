FROM nvidia/cuda:11.7.1-devel-ubuntu20.04
FROM python:3.10.6-bullseye

# Install OpenJDK 8
RUN apt-get update && \
    apt-get install -y openjdk-8-jdk && \
    rm -rf /var/lib/apt/lists/*

ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
ENV PATH=$PATH:$JAVA_HOME/bin
RUN echo $JAVA_HOME

RUN apt-get update -y && apt-get install -y libzbar-dev bash gcc git libc-dev curl wget vim nano \
    && apt-get install -y iputils-ping telnet openssh-client net-tools \
    man unzip vim-tiny bc openssh-server thrift-compiler netcat sudo \
    && apt-get install -y build-essential \
    && apt-get autoremove -y \
    && apt-get clean

# install spark
COPY spark-3.3.0-bin-hadoop3-scala2.13.tgz spark-3.3.0-bin-hadoop3-scala2.13.tgz

RUN tar -xzvf spark-3.3.0-bin-hadoop3-scala2.13.tgz && \
    mv park-3.3.0-bin-hadoop3-scala2.13 /opt/spark && \
    rm -rf park-3.3.0-bin-hadoop3-scala2.13.tgz

ENV SPARK_HOME=/opt/spark
ENV PATH=$PATH:$SPARK_HOME/bin
ENV PATH=$PATH:$SPARK_HOME/sbin
ENV PYTHONPATH=$SPARK_HOME/python3:$SPARK_HOME/python3/lib/py4j-0.10.7-src.zip:$PYTHONPATH
RUN mkdir -p /opt/spark/history
COPY spark-defaults.conf /opt/spark/conf/spark-defaults.conf

COPY requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt
ADD spark-master.sh spark-worker.sh /
