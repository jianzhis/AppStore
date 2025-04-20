# gitea

## 介绍
轻量级自托管Git服务

## 主要功能
- Kubernetes 应用部署
- 资源限制和请求配置
- 环境变量配置
- 服务暴露配置

## 配置参数说明
| 参数名称 | 描述 | 类型 | 默认值 |
|---------|-----|------|--------|
| `replicaCount` | 副本数量 | integer | 1 |
| `image.repository` | 应用名称 | string | gitea/gitea |
| `image.tag` | 应用标签 | string | latest |
| `image.pullPolicy` | 应用拉取策略 | string | IfNotPresent |
| `resources.limits.cpu` | CPU 限制 | string | 1000m |
| `resources.limits.memory` | 内存限制 | string | 1024Mi |
| `env.USER_UID.value` | Gitea运行用户的UID，示例：1000 | string | "1000" |
| `env.USER_GID.value` | Gitea运行用户的GID，示例：1000 | string | "1000" |
| `env.GITEA_SERVER_URL.value` | Gitea外部访问地址，示例：http://localhost:3000 | string | "http://localhost:3000" |
| `env.GITEA_DB_TYPE.value` | 数据库类型，示例：mysql | string | "mysql" |
| `env.GITEA_DB_USER.value` | 数据库用户名，示例：gitea | string | "gitea" |
| `env.GITEA_DB_PASSWORD.value` | 数据库密码，示例：gitea_password | string | "gitea_password" |

## 部署步骤
1. 输入配置参数
2. 选择拥有足够配置应用空间
3. 立即部署

## 使用说明
轻量级自托管Git服务

## 故障排除
1. Pod 无法启动
  - 检查资源限制是否合理
  - 检查应用是否存在且可访问
  
2. 服务无法访问
  - 检查服务端口配置
  - 检查 Pod 运行状态