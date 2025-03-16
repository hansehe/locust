FROM python:3.11-slim as dev

WORKDIR /app

RUN pip install poetry==1.7.1

COPY pyproject.toml poetry.lock ./
RUN poetry config virtualenvs.create false
RUN poetry install --no-root

FROM dev as final

COPY . .

ENV TARGET_HOST=https://target-host.localhost

ENTRYPOINT locust -f locustfile.py
