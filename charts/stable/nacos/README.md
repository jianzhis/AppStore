# nacos

## 介绍
阿里巴巴开源的服务发现和配置管理平台

## 主要功能
- Kubernetes 应用部署
- 资源限制和请求配置
- 环境变量配置
- 服务暴露配置

## 配置参数说明
| 参数名称 | 描述 | 类型 | 默认值 |
|---------|-----|------|--------|
| `replicaCount` | 副本数量 | integer | 1 |
| `image.repository` | 应用名称 | string | nacos/nacos-server |
| `image.tag` | 应用标签 | string | v2.3.0 |
| `image.pullPolicy` | 应用拉取策略 | string | IfNotPresent |
| `resources.limits.cpu` | CPU 限制 | string | undefined |
| `resources.limits.memory` | 内存限制 | string | undefined |
| `env.MODE.value` | 单机模式 | string | "standalone" |
| `env.SPRING_DATASOURCE_PLATFORM.value` | 数据源类型 | string | "mysql" |
| `env.MYSQL_SERVICE_HOST.value` | MySQL地址 | string | "mysql" |

## 部署步骤
1. 输入配置参数
2. 选择拥有足够配置应用空间
3. 立即部署

## 使用说明
阿里巴巴开源的服务发现和配置管理平台

## 故障排除
1. Pod 无法启动
  - 检查资源限制是否合理
  - 检查应用是否存在且可访问
  
2. 服务无法访问
  - 检查服务端口配置
  - 检查 Pod 运行状态