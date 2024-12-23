# hedgedoc

## 介绍
实时协作的 Markdown 编辑器，支持多人同时编辑

## 主要功能
- Kubernetes 应用部署
- 资源限制和请求配置
- 环境变量配置  
- 服务暴露配置

## 配置参数说明
| 参数名称 | 描述 | 类型 | 默认值 |
|---------|-----|------|--------|
| `replicaCount` | 副本数量 | integer | 1 |
| `image.repository` | 应用名称 | string | linuxserver/hedgedoc |
| `image.tag` | 应用标签 | string | 1.9.7 |
| `image.pullPolicy` | 应用拉取策略 | string | IfNotPresent |
| `resources.limits.cpu` | CPU 限制 | string | 1000m |
| `resources.limits.memory` | 内存限制 | string | 1024Mi |
| `env.CMD_DOMAIN.value` | HedgeDoc域名 | string | "localhost" |
| `env.CMD_URL_ADDPORT.value` | URL是否添加端口 | string | "true" |
| `env.CMD_ALLOW_ANONYMOUS.value` | 允许匿名访问 | string | "true" |

## 部署步骤
1. 输入配置参数
2. 选择拥有足够配置应用空间
3. 立即部署

## 使用说明
实时协作的 Markdown 编辑器，支持多人同时编辑

## 故障排除
1. Pod 无法启动
 - 检查资源限制是否合理
 - 检查应用是否存在且可访问
 
2. 服务无法访问
 - 检查服务端口配置
 - 检查 Pod 运行状态