# Redis Chart

## 介绍
本 Chart 部署 Redis 服务，支持持久化存储和密码保护。

## 配置参数说明

| 参数名称               | 描述                | 类型   | 默认值             |
|------------------------|---------------------|--------|--------------------|
| `replicaCount`         | 副本数量            | 整数   | `1`                |
| `image.imageRegistry`  | 镜像仓库地址        | 字符串 | `registry-2.yunna.net` |
| `image.repository`     | 镜像名称            | 字符串 | `library/redis`    |
| `image.tag`            | 镜像版本            | 字符串 | `6.2`              |
| `env.REDIS_PASSWORD`   | Redis 密码          | 字符串 | `defaultpassword`  |
| `service.type`         | 服务类型            | 字符串 | `ClusterIP`        |
| `service.port`         | 服务端口            | 整数   | `6379`             |
| `persistence.enabled`  | 是否启用持久化存储  | 布尔值 | `true`             |
| `persistence.size`     | 存储大小            | 字符串 | `1Gi`              |

## 部署步骤
1. 修改 `values.yaml` 文件，根据需要配置参数。
2. 执行以下命令部署 Chart：
   ```bash
   helm install redis ./redis
## 使用说明
1. 默认 Redis 监听端口为 6379。
2. 使用 REDIS_PASSWORD 环境变量设置密码。