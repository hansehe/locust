FROM python:3.8-buster

RUN apt-get update -y
RUN apt-get install build-essential libssl-dev libffi-dev -y

WORKDIR /src

COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt

COPY . .

ENV TARGET_HOST=target-host.localhost

ENTRYPOINT locust -f locustfile.py
