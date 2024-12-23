# node-red

## 介绍
Node-RED 是一个基于流程的开发工具,用于以可视化方式连接硬件设备、API和在线服务

## 主要功能
- Kubernetes 应用部署
- 资源限制和请求配置
- 环境变量配置  
- 服务暴露配置

## 配置参数说明
| 参数名称 | 描述 | 类型 | 默认值 |
|---------|-----|------|--------|
| `replicaCount` | 副本数量 | integer | 1 |
| `image.repository` | 应用名称 | string | nodered/node-red |
| `image.tag` | 应用标签 | string | 3.1.0-minimal |
| `image.pullPolicy` | 应用拉取策略 | string | IfNotPresent |
| `resources.limits.cpu` | CPU 限制 | string | 1000m |
| `resources.limits.memory` | 内存限制 | string | 1024Mi |
| `env.NODE_RED_ENABLE_PROJECTS.value` | 启用项目功能 | string | "true" |
| `env.NODE_RED_ENABLE_SAFE_MODE.value` | 禁用安全模式 | string | "false" |
| `env.FLOWS.value` | 流程文件名称 | string | "flows.json" |
| `env.NODE_PATH.value` | Node模块路径 | string | "/usr/src/node-red/node_modules:/data/node_modules" |
| `env.TZ.value` | 时区设置 | string | "Asia/Shanghai" |
| `env.NODE_RED_CREDENTIAL_SECRET.value` | 凭证密钥 | string | "your-secret-key" |

## 部署步骤
1. 输入配置参数
2. 选择拥有足够配置应用空间
3. 立即部署

## 使用说明
Node-RED 是一个基于流程的开发工具,用于以可视化方式连接硬件设备、API和在线服务

## 故障排除
1. Pod 无法启动
 - 检查资源限制是否合理
 - 检查应用是否存在且可访问
 
2. 服务无法访问
 - 检查服务端口配置
 - 检查 Pod 运行状态