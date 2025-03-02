#!/usr/bin/env bash
#
#  Licensed to the Apache Software Foundation (ASF) under one   *
#  or more contributor license agreements.  See the NOTICE file *
#  distributed with this work for additional information        *
#  regarding copyright ownership.  The ASF licenses this file   *
#  to you under the Apache License, Version 2.0 (the            *
#  "License"); you may not use this file except in compliance   *
#  with the License.  You may obtain a copy of the License at   *
#                                                               *
#    http://www.apache.org/licenses/LICENSE-2.0                 *
#                                                               *
#  Unless required by applicable law or agreed to in writing,   *
#  software distributed under the License is distributed on an  *
#  "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY       *
#  KIND, either express or implied.  See the License for the    *
#  specific language governing permissions and limitations      *
#  under the License.

set -x

cd /usr/local/lib/python3.6/site-packages/airflow && \
cp -R example_dags/* /home/airflow/airflow/dags/ && \
cp -R contrib/example_dags/example_kubernetes_*.py /home/airflow/airflow/dags/ && \
cp -a contrib/example_dags/libs /home/airflow/airflow/dags/ && \
cp -R plugins/* /home/airflow/airflow/plugins/ && \
airflow initdb && \
alembic upgrade heads && \
(airflow users --create --username airflow --lastname airflow --firstname jon --email airflow@apache.org --role Admin --password airflow || true) && \
echo "retrieved from mount" > /root/test_volume/test.txt
