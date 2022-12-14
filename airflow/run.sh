#!/bin/sh


set -o errexit
set -o nounset

airflow db init

airflow users create \
          --username admin \
          --firstname admin \
          --lastname admin \
          --password admin \
          --role Admin \
          --email ky.dangthe@pharmacity.vn

airflow webserver -p 8000 & sleep 1 & airflow scheduler

