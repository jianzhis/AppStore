# 🐧 Ubuntu 20.04

## 🛠️ 介绍

**Ubuntu 20.04** 是一个长期支持版本(LTS)的 Linux 发行版。这个 Helm Chart 提供了在 Kubernetes 集群中运行 Ubuntu 20.04 容器的能力。它可以用于：

- 开发和测试环境
- 调试和故障排查
- 作为其他应用的基础镜像
- 运行特定的 Linux 工具和命令

### ⭐ 主要特性

- **🔒 安全性**：使用官方 Ubuntu 20.04 镜像
- **💾 持久化存储**：支持数据持久化
- **🎯 资源控制**：可配置的资源限制和请求
- **🔄 可扩展性**：支持多副本部署
- **⚙️ 可定制化**：支持自定义启动命令

## ⚙️ 配置参数说明

### 基础配置参数

| 参数名称                   | 描述                                      | 类型   | 默认值     | 示例值    |
|----------------------------|-------------------------------------------|--------|------------|-----------|
| `replicaCount`            | 部署的副本数量                            | 整数   | `1`        | `2`       |
| `image.tag`               | Ubuntu 镜像版本                           | 字符串 | `20.04`    | `20.04`   |
| `resources.limits.cpu`     | CPU 限制                                 | 字符串 | `500m`     | `1000m`   |
| `resources.limits.memory`  | 内存限制                                 | 字符串 | `512Mi`    | `1024Mi`  |
| `resources.requests.cpu`   | CPU 请求                                 | 字符串 | `250m`     | `500m`    |
| `resources.requests.memory`| 内存请求                                 | 字符串 | `256Mi`    | `512Mi`   |

### 持久化存储配置

| 参数名称                    | 描述                                      | 类型    | 默认值          |
|----------------------------|-------------------------------------------|---------|-----------------|
| `persistence.enabled`      | 是否启用持久化存储                         | 布尔值  | `true`         |
| `persistence.size`         | 存储容量                                  | 字符串  | `1Gi`          |
| `persistence.storageClass` | 存储类名称                                | 字符串  | `local`        |

## 📦 部署步骤

1. **准备配置**：
   - 确定所需的配置参数
   - 准备 values.yaml 文件或使用默认配置

2. **部署**：
   ```bash
   helm install my-ubuntu ./ubuntu
   ```

3. **验证部署**：
   ```bash
   kubectl get pods -l app.kubernetes.io/name=ubuntu
   ```

## 🔧 使用示例

1. **基础部署**：
   ```bash
   helm install ubuntu ./ubuntu
   ```

2. **自定义资源配置**：
   ```yaml
   resources:
     limits:
       cpu: 1000m
       memory: 1024Mi
     requests:
       cpu: 500m
       memory: 512Mi
   ```

3. **启用持久化存储**：
   ```yaml
   persistence:
     enabled: true
     size: 5Gi
     storageClass: "local"
   ```

## 🚀 进入容器

部署完成后，可以使用以下命令进入容器：

```bash
kubectl exec -it <pod-name> -- /bin/bash
```

## 🔍 故障排除

- **Pod 启动失败**：
  - 检查资源配置是否合理
  - 验证持久化存储配置
  
- **无法访问持久化数据**：
  - 确认 PVC 状态
  - 检查存储类配置

## 📝 注意事项

1. 默认配置适用于测试环境，生产环境请根据需求调整资源配置
2. 建议使用持久化存储以保存重要数据
3. 定期更新镜像以获取安全补丁