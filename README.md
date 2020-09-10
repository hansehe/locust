# Load Testing With [Locust](https://locust.io/)

See locust docs:
- https://docs.locust.io/en/stable/index.html

## Run Helm Chart
```bash
helm repo add locust 'https://raw.githubusercontent.com/hansehe/locust/master/helm/charts'
helm install locust locust/locust --version 0.1.0
```

## Requirements
```
pip install -r src/requirements.txt
```

## Run
Run cmd below and locate locust at http://localhost:8089/
```
cd src/
locust -f locustfile.py
```

## Run Headless 
See official documentation: 
- https://docs.locust.io/en/stable/running-locust-without-web-ui.html

```
cd src/
locust -f locustfile.py --no-web -c 10 -r 10 --run-time 1h30m --stop-timeout 99
```

`-c` specifies the number of Locust clients to spawn, and `-r` specifies the hatch rate (number of clients to spawn per second).

## Run With [DockerBuildManagement](https://github.com/DIPSAS/DockerBuildManagement) & [Docker](https://www.docker.com/)
Change or expose any of the environment variables in [src/.env](src/.env)

### Requirements
```
pip install --upgrade DockerBuildManagement
```

### Run With Web UI
Locate locust at http://localhost:8089/
```
dbm -build -run service
```

### Run Tests Headless
```
dbm -test service
```

### Publish Image & Helm
```
dbm -build -publish
```
