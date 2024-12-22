# syncthing

## 介绍
Syncthing 是一个开源的文件同步工具，提供安全的点对点文件同步功能。它能够在多个设备之间保持指定文件夹的内容同步，所有通信都经过加密，确保数据传输的安全性。支持版本控制、冲突检测和自动同步，是团队文件共享和个人数据同步的理想选择。

## 主要功能
- Kubernetes 应用部署
- 资源限制和请求配置
- 环境变量配置
- 服务暴露配置

## 配置参数说明
| 参数名称 | 描述 | 类型 | 默认值 |
|---------|-----|------|--------|
| `replicaCount` | 副本数量 | integer | 1 |
| `image.repository` | 应用名称 | string | syncthing/syncthing |
| `image.tag` | 应用标签 | string | latest |
| `image.pullPolicy` | 应用拉取策略 | string | IfNotPresent |
| `resources.limits.cpu` | CPU 限制 | string | 1000m |
| `resources.limits.memory` | 内存限制 | string | 1024Mi |
| `env.STGUIADDRESS.value` | Web UI监听地址和端口 | string | "0.0.0.0:8384" |
| `env.STNOUPGRADE.value` | 禁用自动升级 | string | "true" |

## 部署步骤
1. 输入配置参数
2. 选择拥有足够配置应用空间
3. 立即部署

## 使用说明
Syncthing 是一个开源的文件同步工具，提供安全的点对点文件同步功能。它能够在多个设备之间保持指定文件夹的内容同步，所有通信都经过加密，确保数据传输的安全性。支持版本控制、冲突检测和自动同步，是团队文件共享和个人数据同步的理想选择。

## 故障排除
1. Pod 无法启动
  - 检查资源限制是否合理
  - 检查应用是否存在且可访问
  
2. 服务无法访问
  - 检查服务端口配置
  - 检查 Pod 运行状态