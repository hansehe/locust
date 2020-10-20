# Locust

## Introduction

Locust load testing helm chart:
- https://locust.io/

Original source code:
- https://github.com/hansehe/locust

## Installing the Chart

To install the chart with the release name `locust` run:

```bash
$ helm repo add locust https://raw.githubusercontent.com/hansehe/locust/master/helm/charts
$ helm install locust \
--set image.repository=hansehe/locust \
locust/locust
```

Override the image repository value to set your own locust image.

Alternatively, a YAML file that specifies the values for the parameters can be provided while installing the chart. For example,

```bash
$ helm install locust -f values.yaml locust/locust
```

## Configuration

Find all possible configuration values here:
- https://github.com/hansehe/locust/blob/master/helm/locust/values.yaml
