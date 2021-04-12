# multi-gatekeeper
[![Artifact HUB](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/dteam-helm-charts)](https://artifacthub.io/packages/search?repo=dteam-helm-charts)

django helm is a chart that can be used to easily deploy django applications to kubernetes cluster.

## Installation

```bash
helm repo add dteam https://dteamdev.github.io/charts
helm install dteam/helm-django -n kube-system -f your.values.yaml
```

## Introduction

This chart deploys a multiple instances of keycloak gatekeeper authentication server

## Configuration options

For all options look at `values.yaml` file
