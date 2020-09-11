FROM python:3.8-buster

WORKDIR /src

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

COPY . .

ENV TARGET_HOST=https://target-host.localhost

ENTRYPOINT locust -f locustfile.py
