# homeassistant

## 介绍
Home Assistant 是一个开源的家庭自动化平台，能够追踪和控制智能家居设备，支持多种自动化场景和设备集成。

## 主要功能
- Kubernetes 应用部署
- 资源限制和请求配置
- 环境变量配置
- 服务暴露配置

## 配置参数说明
| 参数名称 | 描述 | 类型 | 默认值 |
|---------|-----|------|--------|
| `replicaCount` | 副本数量 | integer | 1 |
| `image.repository` | 应用名称 | string | homeassistant/home-assistant |
| `image.tag` | 应用标签 | string | 2024.1.3 |
| `image.pullPolicy` | 应用拉取策略 | string | IfNotPresent |
| `resources.limits.cpu` | CPU 限制 | string | 2000m |
| `resources.limits.memory` | 内存限制 | string | 2048Mi |
| `env.TZ.value` | 时区设置 | string | "Asia/Shanghai" |
| `env.PUID.value` | 用户ID | string | "1000" |
| `env.PGID.value` | 用户组ID | string | "1000" |

## 部署步骤
1. 输入配置参数
2. 选择拥有足够配置应用空间
3. 立即部署

## 使用说明
Home Assistant 是一个开源的家庭自动化平台，能够追踪和控制智能家居设备，支持多种自动化场景和设备集成。

## 故障排除
1. Pod 无法启动
  - 检查资源限制是否合理
  - 检查应用是否存在且可访问
  
2. 服务无法访问
  - 检查服务端口配置
  - 检查 Pod 运行状态