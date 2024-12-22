# lsky-pro

## 介绍
Lsky Pro 是一个开源的图床程序，支持第三方云储存，支持多用户系统，支持鉴黄，支持多图上传，支持评论系统等功能

## 主要功能
- Kubernetes 应用部署
- 资源限制和请求配置
- 环境变量配置
- 服务暴露配置

## 配置参数说明
| 参数名称 | 描述 | 类型 | 默认值 |
|---------|-----|------|--------|
| `replicaCount` | 副本数量 | integer | 1 |
| `image.repository` | 应用名称 | string | halcyonazure/lsky-pro |
| `image.tag` | 应用标签 | string | 2.1 |
| `image.pullPolicy` | 应用拉取策略 | string | IfNotPresent |
| `resources.limits.cpu` | CPU 限制 | string | 1000m |
| `resources.limits.memory` | 内存限制 | string | 1024Mi |
| `env.DB_HOST.value` | MySQL数据库主机地址 | string | "mysql" |
| `env.DB_PORT.value` | MySQL数据库端口 | string | "3306" |
| `env.DB_DATABASE.value` | MySQL数据库名称 | string | "lsky" |
| `env.DB_USERNAME.value` | MySQL数据库用户名 | string | "lsky" |
| `env.DB_PASSWORD.value` | MySQL数据库密码 | string | "lsky_password" |
| `env.APP_URL.value` | 应用URL | string | "http://localhost" |
| `env.APP_KEY.value` | 应用密钥 | string | "base64:random_string_here" |
| `env.APP_DEBUG.value` | 是否开启调试模式 | string | "false" |
| `env.REDIS_HOST.value` | Redis主机地址 | string | "redis" |
| `env.REDIS_PASSWORD.value` | Redis密码 | string | "null" |
| `env.REDIS_PORT.value` | Redis端口 | string | "6379" |

## 部署步骤
1. 输入配置参数
2. 选择拥有足够配置应用空间
3. 立即部署

## 使用说明
Lsky Pro 是一个开源的图床程序，支持第三方云储存，支持多用户系统，支持鉴黄，支持多图上传，支持评论系统等功能

## 故障排除
1. Pod 无法启动
  - 检查资源限制是否合理
  - 检查应用是否存在且可访问
  
2. 服务无法访问
  - 检查服务端口配置
  - 检查 Pod 运行状态