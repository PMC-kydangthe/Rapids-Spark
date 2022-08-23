FROM nvidia/cuda:11.7.1-devel-ubuntu20.04
FROM jupyter/scipy-notebook:python-3.10.5

USER root

# Install OpenJDK 11
RUN apt-get update && \
    apt-get install -y openjdk-11-jdk ca-certificates-java && \
    apt-get clean && \
    update-ca-certificates -f
    

ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
ENV PATH=$PATH:$JAVA_HOME/bin
RUN echo $JAVA_HOME


RUN apt-get update -y \
    && apt-get install -y build-essential \
    && apt-get autoremove -y \
    && apt-get clean

USER 1000

# install spark
COPY spark-3.3.0-bin-hadoop3-scala2.13.tgz spark-3.3.0-bin-hadoop3-scala2.13.tgz

RUN tar -xzvf spark-3.3.0-bin-hadoop3-scala2.13.tgz && \
    mv spark-3.3.0-bin-hadoop3-scala2.13 /usr/local/spark && \
    rm -rf spark-3.3.0-bin-hadoop3-scala2.13.tgz


ENV SPARK_HOME=/usr/local/spark
ENV PATH=$PATH:$SPARK_HOME/bin
ENV PATH=$PATH:$SPARK_HOME/sbin
ENV PYTHONPATH=$SPARK_HOME/python3:$SPARK_HOME/python3/lib/py4j-0.10.7-src.zip:$PYTHONPATH

COPY requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

COPY ./jars /usr/local/spark/jars
