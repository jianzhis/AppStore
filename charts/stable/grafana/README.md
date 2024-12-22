# grafana

## 介绍
Grafana 是一个开源的可视化和分析平台。支持多种数据源，可以创建丰富的仪表板，是物联网数据可视化的理想选择。

## 主要功能
- Kubernetes 应用部署
- 资源限制和请求配置
- 环境变量配置
- 服务暴露配置

## 配置参数说明
| 参数名称 | 描述 | 类型 | 默认值 |
|---------|-----|------|--------|
| `replicaCount` | 副本数量 | integer | 1 |
| `image.repository` | 应用名称 | string | grafana/grafana |
| `image.tag` | 应用标签 | string | 10.2.3 |
| `image.pullPolicy` | 应用拉取策略 | string | IfNotPresent |
| `resources.limits.cpu` | CPU 限制 | string | 1000m |
| `resources.limits.memory` | 内存限制 | string | 1024Mi |
| `env.GF_SECURITY_ADMIN_USER.value` | 管理员用户名 | string | "admin" |
| `env.GF_SECURITY_ADMIN_PASSWORD.value` | 管理员密码 | string | "password123" |
| `env.GF_INSTALL_PLUGINS.value` | 默认安装的插件 | string | "grafana-clock-panel,grafana-simple-json-datasource" |

## 部署步骤
1. 输入配置参数
2. 选择拥有足够配置应用空间
3. 立即部署

## 使用说明
Grafana 是一个开源的可视化和分析平台。支持多种数据源，可以创建丰富的仪表板，是物联网数据可视化的理想选择。

## 故障排除
1. Pod 无法启动
  - 检查资源限制是否合理
  - 检查应用是否存在且可访问
  
2. 服务无法访问
  - 检查服务端口配置
  - 检查 Pod 运行状态