# adminer

## 介绍
轻量级的数据库管理工具

## 主要功能
- Kubernetes 应用部署
- 资源限制和请求配置
- 环境变量配置
- 服务暴露配置

## 配置参数说明
| 参数名称 | 描述 | 类型 | 默认值 |
|---------|-----|------|--------|
| `replicaCount` | 副本数量 | integer | 1 |
| `image.repository` | 应用名称 | string | dockette/adminer |
| `image.tag` | 应用标签 | string | latest |
| `image.pullPolicy` | 应用拉取策略 | string | IfNotPresent |
| `resources.limits.cpu` | CPU 限制 | string | undefined |
| `resources.limits.memory` | 内存限制 | string | undefined |
| `env.ADMINER_DESIGN.value` | Adminer界面主题风格设置 示例：pepa-linha | string | "pepa-linha" |
| `env.ADMINER_DB.value` | 要连接的数据库类型 示例：mysql | string | "mysql" |
| `env.ADMINER_SERVER.value` | 要连接的MySQL数据库服务地址 示例：mysql（填写MySQL服务名） | string | "mysql" |
| `env.ADMINER_USERNAME.value` | 连接数据库的用户名 示例：root | string | "root" |
| `env.ADMINER_PASSWORD.value` | 连接数据库的密码 示例：123456 | string | "123456" |

## 部署步骤
1. 输入配置参数
2. 选择拥有足够配置应用空间
3. 立即部署

## 使用说明
轻量级的数据库管理工具

## 故障排除
1. Pod 无法启动
  - 检查资源限制是否合理
  - 检查应用是否存在且可访问
  
2. 服务无法访问
  - 检查服务端口配置
  - 检查 Pod 运行状态