# 应用名称

## 介绍
[详细的应用介绍]

## 主要功能
- [功能点列表]

## 配置参数说明
| 参数名称 | 描述 | 类型 | 默认值 |
|---------|-----|------|--------|
| `参数路径` | 参数说明 | 参数类型 | 默认值 |

## 部署步骤
[部署说明]

## 使用说明
[使用方法]

## 故障排除
[常见问题和解决方案]
我写的是redis，部署是部署在k8s里面，就写通过云纳部署

# Answer

# Redis 应用

## 介绍
Redis 是一个开源的高性能键值存储数据库，广泛应用于缓存、消息队列等场景。本项目为 Redis 在 Kubernetes 上的部署配置，旨在为用户提供简单易用的部署模板。

## 主要功能
- 高效的键值存储
- 支持持久化存储
- 提供集群模式和主从复制功能
- 可通过环境变量配置敏感信息

## 配置参数说明
| 参数名称                          | 描述                       | 类型       | 默认值       |
|---------------------------------|--------------------------|----------|------------|
| `replicaCount`                  | 副本数量                   | 整数      | 1          |
| `image.imageRegistry`           | 镜像仓库                  | 字符串    | "registry-2.yunna.net" |
| `image.repository`              | 镜像名称                  | 字符串    | "redis"    |
| `image.tag`                     | 镜像标签                  | 字符串    | "6.2.6"    |
| `service.type`                  | 服务类型                  | 字符串    | "ClusterIP" |
| `service.port`                  | Redis 默认端口            | 整数      | 6379       |
| `resources.limits.cpu`          | CPU 限制                  | 字符串    | "500m"     |
| `resources.limits.memory`       | 内存限制                  | 字符串    | "512Mi"    |
| `resources.requests.cpu`         | CPU 请求                  | 字符串    | "250m"     |
| `resources.requests.memory`      | 内存请求                  | 字符串    | "256Mi"    |
| `persistence.enabled`            | 启用持久化                | 布尔值    | true       |
| `persistence.accessMode`        | 存储访问模式              | 字符串    | "ReadWriteOnce" |
| `persistence.size`              | 存储大小                  | 字符串    | "1Gi"      |
| `persistence.storageClass`      | 存储类                    | 字符串    | "local"    |
| `env.redis_password.name`       | 环境变量名                | 字符串    | "REDIS_PASSWORD" |
| `env.redis_password.value`      | 环境变量值                | 字符串    | "yourpassword" |

## 部署步骤
1. 确保 Kubernetes 集群正常运行。
2. 使用 kubectl 应用配置文件：
   ```bash
   kubectl apply -f values.yaml
   ```
3. 验证 Redis 服务是否正常运行：
   ```bash
   kubectl get pods
   ```

## 使用说明
- 连接到 Redis 服务：
  ```bash
  kubectl exec -it <pod-name> -- redis-cli -h localhost -p 6379
  ```
- 使用环境变量配置连接信息，确保在生产环境中保护敏感信息如密码。

## 故障排除
- **问题**：Pod 无法启动。
  **解决方案**：检查资源配置是否合理，查看 Pod 的日志获取详细错误信息。
  
- **问题**：无法连接 Redis。
  **解决方案**：确认服务类型和端口是否配置正确，使用 `kubectl get svc` 检查服务状态。

- **问题**：持久化存储没有生效。
  **解决方案**：确认存储类已正确配置并且集群中有可用的存储资源。 

通过以上步骤，您可以成功部署并配置 Redis 应用于 Kubernetes。希望本 README 对您有所帮助！