# onlyoffice-documentserver Helm Chart

## 介绍

ONLYOFFICE Document Server 是一个功能强大的在线文档协作工具，支持多人实时编辑，能够极大提高团队的工作效率。用户可以通过浏览器访问，进行文档的创建、编辑和共享，非常适合企业、教育机构及个人用户进行远程协作。该工具兼容多种文档格式，包括但不限于 Word、Excel 和 PowerPoint 文件，还具备良好的版本控制和实时协作功能。

## 主要功能

- **在线编辑**：支持在线创建和编辑 Word、Excel 和 PowerPoint 文档，提供丰富的编辑功能和格式设置。
- **实时协作**：多位用户可以实时同时编辑同一文档，所有变更即时同步，提升团队协作效率。
- **版本控制**：系统自动保存文档的历史版本，可以随时查看和恢复先前的版本。
- **多格式支持**：支持多种文件格式的预览和转换，方便用户在不同文件格式之间切换。

## 配置参数说明

| 参数名称              | 描述             | 类型    | 默认值                    |
| --------------------- | ---------------- | ------- | ------------------------- |
| `replicaCount`        | 副本数量         | integer | 1                         |
| `image.repository`    | 镜像仓库地址     | string  | onlyoffice/documentserver |
| `image.tag`           | 镜像版本         | string  | latest                    |
| `persistence.enabled` | 是否启用持久化   | boolean | true                      |
| `persistence.size`    | 持久化存储大小   | string  | 1Gi                       |
| `nodePort`            | NodePort 端口    | integer | 30000                     |
| `secretKey`           | 秘钥，用于安全性 | string  | 生成的随机字符串          |

## 部署步骤

1. **添加仓库**：首先您需要添加 ONLYOFFICE Document Server 的 Helm 仓库。您可以通过以下命令进行添加：

   ```
   helm repo add stable https://your-repo-url
   ```

2. **创建 `values.yaml` 文件**：根据您的需求修改部署参数，创建一个 `values.yaml` 文件，例如：

   ```yaml
   replicaCount: 2
   image:
     repository: onlyoffice/documentserver
     tag: latest
   persistence:
     enabled: true
     size: 1Gi
   nodePort: 30000
   secretKey: "生成的随机字符串"
   ```

3. **使用 Helm 部署**：在修改完参数之后，使用以下命令部署 Chart：

   ```
   helm install my-release stable/onlyoffice-documentserver -f values.yaml
   ```

4. **访问服务**：部署成功后，您可以通过 NodePort 或 ClusterIP 访问 ONLYOFFICE Document Server，启动文档协作服务。可以在浏览器中输入 `http://<你的节点IP>:<nodePort>` 来访问。

## 使用说明

在浏览器中打开指定的 NodePort 或 ClusterIP 地址后，您将看到 ONLYOFFICE Document Server 的界面。您可以创建新文档或者上传已有的文档，开始进行在线编辑和协作。

## 故障排除

- **持久化存储问题**：确保持久化存储的配置正确且可用，避免因存储问题导致的数据丢失。
- **环境变量设置**：确认环境变量 `SECRET_KEY` 已正确设置，以保证系统的安全性。
- **检查日志**：如果服务启动失败，查看相关 Pod 的日志以获取更多错误信息。使用命令 `kubectl logs <pod-name>`。

通过这些步骤和提示，您可以顺利部署和使用 ONLYOFFICE Document Server，提升团队的协作效率。
