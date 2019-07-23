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
#  under the License.                                           *

FROM python:3.6-slim
# install deps
RUN apt-get update -y && apt-get install -y \
        wget \
        libczmq-dev \
        curl \
        libssl-dev \
        git \
        inetutils-telnet \
        bind9utils \
        zip \
        unzip \
        gcc \
        vim \
    && apt-get clean
RUN pip install --upgrade pip
# install airflow
COPY airflow.tar.gz /tmp/airflow.tar.gz
# Since we install vanilla Airflow, we also want to have support for Postgres and Kubernetes
RUN pip install -U setuptools && \
    pip install kubernetes && \
    pip install cryptography && \
    # pip install tornado>=4.2.0, <6.0 && \
    pip install celery~=4.3 && \
    # pip install flower>=0.7.3, <1.0 && \
    pip install librabbitmq>=1.6.1 && \
    # pip install boto3>=1.7.0, <1.8.0 && \
    pip install redis~=3.2 && \
    # pip install cassandra-driver>=3.13.0 && \
    pip install psycopg2-binary==2.7.4  # I had issues with older versions of psycopg2, just a warning
RUN pip install apache-airflow[celery,s3,redis,rabbitmq] && \
    pip install -U "flask==1.0.3" && \
    pip install -U "Werkzeug==0.14.1" && \
    pip install -U "Jinja2==2.10.0" && \
    pip install -U "simple-salesforce==0.74.3" && \
    pip install -U "alembic>=1.0,<2.0"
RUN mkdir -p /home/airflow/airflow
COPY airflow-test-env-init.sh /tmp/airflow-test-env-init.sh
COPY bootstrap.sh /bootstrap.sh
RUN chmod +x /bootstrap.sh
ENTRYPOINT ["/bootstrap.sh"]
