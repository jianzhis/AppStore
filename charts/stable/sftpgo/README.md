# sftpgo

## 介绍
SFTPGo 是一个功能齐全的 SFTP 服务器，具有可选的 FTP/S 和 WebDAV 支持。它可用作 S3 或其他云存储服务的前端，支持本地文件系统和各种云存储后端

## 主要功能
- Kubernetes 应用部署
- 资源限制和请求配置
- 环境变量配置
- 服务暴露配置

## 配置参数说明
| 参数名称 | 描述 | 类型 | 默认值 |
|---------|-----|------|--------|
| `replicaCount` | 副本数量 | integer | 1 |
| `image.repository` | 应用名称 | string | drakkan/sftpgo |
| `image.tag` | 应用标签 | string | v2.5.6 |
| `image.pullPolicy` | 应用拉取策略 | string | IfNotPresent |
| `resources.limits.cpu` | CPU 限制 | string | 1000m |
| `resources.limits.memory` | 内存限制 | string | 1024Mi |
| `env.SFTPGO_DEFAULT_ADMIN_USERNAME.value` | 默认管理员用户名 | string | "admin" |
| `env.SFTPGO_DEFAULT_ADMIN_PASSWORD.value` | 默认管理员密码 | string | "password" |
| `env.SFTPGO_WEBDAV_PORT.value` | WebDAV端口 | string | "8081" |
| `env.SFTPGO_LOG_LEVEL.value` | 日志级别 | string | "info" |
| `env.SFTPGO_HTTP_PORT.value` | HTTP端口 | string | "8080" |
| `env.SFTPGO_SFTP_PORT.value` | SFTP端口 | string | "2022" |
| `env.SFTPGO_FTP_PORT.value` | FTP端口 | string | "2121" |
| `env.SFTPGO_FTPS_PORT.value` | FTPS端口 | string | "2990" |
| `env.SFTPGO_DATA_PROVIDER__DRIVER.value` | 数据库驱动类型 | string | "sqlite" |
| `env.SFTPGO_DATA_PROVIDER__NAME.value` | 数据库文件路径 | string | "/srv/sftpgo/sftpgo.db" |
| `env.SFTPGO_HOSTING__MODE.value` | 主机托管模式 | string | "self" |

## 部署步骤
1. 输入配置参数
2. 选择拥有足够配置应用空间
3. 立即部署

## 使用说明
SFTPGo 是一个功能齐全的 SFTP 服务器，具有可选的 FTP/S 和 WebDAV 支持。它可用作 S3 或其他云存储服务的前端，支持本地文件系统和各种云存储后端

## 故障排除
1. Pod 无法启动
  - 检查资源限制是否合理
  - 检查应用是否存在且可访问
  
2. 服务无法访问
  - 检查服务端口配置
  - 检查 Pod 运行状态