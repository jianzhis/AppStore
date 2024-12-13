# Main Charts

## Install

```shell
helm repo add main https://charts.kubesphere.io/main
```

## Contribute

Place your charts under this directory, one chart per separate directory, e.g.

```shell
src/
├── main/
│   ├── example-chart/
│   │   ├── Chart.yaml
│   │   ├── values.yaml
│   │   ├── templates/
│   │   └── ...
│   └── example-chart-2/
│       ├── Chart.yaml
│       ├── values.yaml
│       ├── templates/
│       └── ...
```
部署 Helm Chart
# 部署 CentOS 8
helm install my-centos ./centos-chart --set image.tag="8"

# 部署 CentOS 7
helm install my-centos ./centos-chart --set image.tag="7"
