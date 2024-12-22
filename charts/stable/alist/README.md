# alist

## 介绍
AList 是一个支持多种存储的文件列表程序，支持 WebDAV、网盘挂载、在线播放、离线下载、文件预览等功能。支持 OneDrive、Google Drive、阿里云盘、百度网盘等多种存储方式

## 主要功能
- Kubernetes 应用部署
- 资源限制和请求配置
- 环境变量配置
- 服务暴露配置

## 配置参数说明
| 参数名称 | 描述 | 类型 | 默认值 |
|---------|-----|------|--------|
| `replicaCount` | 副本数量 | integer | 1 |
| `image.repository` | 应用名称 | string | xhofe/alist |
| `image.tag` | 应用标签 | string | v3.30.0 |
| `image.pullPolicy` | 应用拉取策略 | string | IfNotPresent |
| `resources.limits.cpu` | CPU 限制 | string | 1000m |
| `resources.limits.memory` | 内存限制 | string | 1024Mi |
| `env.PUID.value` | 运行用户ID | string | "1000" |
| `env.PGID.value` | 运行用户组ID | string | "1000" |
| `env.UMASK.value` | 文件权限掩码 | string | "022" |
| `env.TZ.value` | 时区设置 | string | "Asia/Shanghai" |
| `env.DB_TYPE.value` | 数据库类型(sqlite3/mysql/postgres) | string | "sqlite3" |
| `env.DB_HOST.value` | 数据库主机地址(使用外部数据库时需要) | string | "" |
| `env.DB_PORT.value` | 数据库端口(使用外部数据库时需要) | string | "" |
| `env.DB_NAME.value` | 数据库名称(使用外部数据库时需要) | string | "" |
| `env.DB_USER.value` | 数据库用户名(使用外部数据库时需要) | string | "" |
| `env.DB_PASS.value` | 数据库密码(使用外部数据库时需要) | string | "" |
| `env.DB_TABLE_PREFIX.value` | 数据库表前缀 | string | "x_" |
| `env.HTTPS.value` | 是否启用HTTPS | string | "false" |
| `env.SITE_URL.value` | 站点URL(留空自动检测) | string | "" |
| `env.CDN.value` | CDN地址(可选) | string | "" |
| `env.MAX_CONNECTIONS.value` | 最大并发连接数 | string | "10" |

## 部署步骤
1. 输入配置参数
2. 选择拥有足够配置应用空间
3. 立即部署

## 使用说明
AList 是一个支持多种存储的文件列表程序，支持 WebDAV、网盘挂载、在线播放、离线下载、文件预览等功能。支持 OneDrive、Google Drive、阿里云盘、百度网盘等多种存储方式

## 故障排除
1. Pod 无法启动
  - 检查资源限制是否合理
  - 检查应用是否存在且可访问
  
2. 服务无法访问
  - 检查服务端口配置
  - 检查 Pod 运行状态