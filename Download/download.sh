
echo ${PWD}

wget --no-verbose https://archive.apache.org/dist/spark/spark-3.3.0/spark-3.3.0-bin-hadoop2.tgz

cp spark-3.3.0-bin-hadoop2.tgz ../airflow/spark-3.3.0-bin-hadoop3-scala2.13.tgz
cp spark-3.3.0-bin-hadoop2.tgz ../spark/spark-3.3.0-bin-hadoop3-scala2.13.tgz
cp spark-3.3.0-bin-hadoop2.tgz ../jupyter/spark-3.3.0-bin-hadoop3-scala2.13.tgz
