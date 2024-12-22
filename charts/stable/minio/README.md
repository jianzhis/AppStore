# minio

## 介绍
MinIO 是一个高性能的分布式对象存储系统，支持原生 Kubernetes 集成，可用于私有云存储、备份存储等场景

## 主要功能
- Kubernetes 应用部署
- 资源限制和请求配置
- 环境变量配置
- 服务暴露配置

## 配置参数说明
| 参数名称 | 描述 | 类型 | 默认值 |
|---------|-----|------|--------|
| `replicaCount` | 副本数量 | integer | 1 |
| `image.repository` | 应用名称 | string | minio/minio |
| `image.tag` | 应用标签 | string | RELEASE.2024-02-26T09-33-28Z |
| `image.pullPolicy` | 应用拉取策略 | string | IfNotPresent |
| `resources.limits.cpu` | CPU 限制 | string | 1000m |
| `resources.limits.memory` | 内存限制 | string | 2048Mi |
| `env.MINIO_ROOT_USER.value` | MinIO管理员用户名，默认为minioadmin | string | "minioadmin" |
| `env.MINIO_ROOT_PASSWORD.value` | MinIO管理员密码，建议修改为安全密码 | string | "minioadmin" |
| `env.MINIO_BROWSER_REDIRECT_URL.value` | Web控制台访问地址，请根据实际部署环境修改 | string | "http://minio.local:9001" |
| `env.MINIO_SERVER_URL.value` | API服务访问地址，请根据实际部署环境修改 | string | "http://minio.local:9000" |
| `env.MINIO_OPTS.value` | MinIO服务启动参数，指定数据目录和控制台端口 | string | "server /data --console-address :9001" |

## 部署步骤
1. 输入配置参数
2. 选择拥有足够配置应用空间
3. 立即部署

## 使用说明
MinIO 是一个高性能的分布式对象存储系统，支持原生 Kubernetes 集成，可用于私有云存储、备份存储等场景

## 故障排除
1. Pod 无法启动
  - 检查资源限制是否合理
  - 检查应用是否存在且可访问
  
2. 服务无法访问
  - 检查服务端口配置
  - 检查 Pod 运行状态