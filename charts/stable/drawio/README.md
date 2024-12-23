# drawio

## 介绍
Draw.io 是一个强大的在线图表编辑工具，支持流程图、UML图、网络拓扑图等多种图表类型的绘制

## 主要功能
- Kubernetes 应用部署
- 资源限制和请求配置
- 环境变量配置  
- 服务暴露配置

## 配置参数说明
| 参数名称 | 描述 | 类型 | 默认值 |
|---------|-----|------|--------|
| `replicaCount` | 副本数量 | integer | 1 |
| `image.repository` | 应用名称 | string | fjudith/draw.io |
| `image.tag` | 应用标签 | string | latest |
| `image.pullPolicy` | 应用拉取策略 | string | IfNotPresent |
| `resources.limits.cpu` | CPU 限制 | string | 1000m |
| `resources.limits.memory` | 内存限制 | string | 1024Mi |
| `env.DRAWIO_BASE_URL.value` | 基础URL | string | "" |
| `env.DRAWIO_CSP_HEADER.value` | 内容安全策略 | string | "frame-ancestors 'self' *;" |
| `env.TZ.value` | 时区设置 | string | "Asia/Shanghai" |
| `env.LANG.value` | 语言设置 | string | "zh_CN.UTF-8" |

## 部署步骤
1. 输入配置参数
2. 选择拥有足够配置应用空间
3. 立即部署

## 使用说明
Draw.io 是一个强大的在线图表编辑工具，支持流程图、UML图、网络拓扑图等多种图表类型的绘制

## 故障排除
1. Pod 无法启动
 - 检查资源限制是否合理
 - 检查应用是否存在且可访问
 
2. 服务无法访问
 - 检查服务端口配置
 - 检查 Pod 运行状态