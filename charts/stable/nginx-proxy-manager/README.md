# nginx-proxy-manager

## 介绍
Nginx反向代理管理工具

## 主要功能
- Kubernetes 应用部署
- 资源限制和请求配置
- 环境变量配置
- 服务暴露配置

## 配置参数说明
| 参数名称 | 描述 | 类型 | 默认值 |
|---------|-----|------|--------|
| `replicaCount` | 副本数量 | integer | 1 |
| `image.repository` | 应用名称 | string | jc21/nginx-proxy-manager |
| `image.tag` | 应用标签 | string | 2.11.1 |
| `image.pullPolicy` | 应用拉取策略 | string | IfNotPresent |
| `resources.limits.cpu` | CPU 限制 | string | undefined |
| `resources.limits.memory` | 内存限制 | string | undefined |
| `env.DB_MYSQL_HOST.value` | 数据库地址，示例：mysql | string | "mysql" |
| `env.DB_MYSQL_PORT.value` | 数据库端口，示例：3306 | string | "3306" |
| `env.DB_MYSQL_USER.value` | 数据库用户名，示例：npm | string | "npm" |
| `env.DB_MYSQL_PASSWORD.value` | 数据库密码，示例：npm123 | string | "" |
| `env.DB_MYSQL_NAME.value` | 数据库名称，示例：npm | string | "npm" |

## 部署步骤
1. 输入配置参数
2. 选择拥有足够配置应用空间
3. 立即部署

## 使用说明
Nginx反向代理管理工具

## 故障排除
1. Pod 无法启动
  - 检查资源限制是否合理
  - 检查应用是否存在且可访问
  
2. 服务无法访问
  - 检查服务端口配置
  - 检查 Pod 运行状态