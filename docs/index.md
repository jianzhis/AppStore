---
layout: default
title: 云纳公共镜像 Helm Charts 仓库
---

# 云纳 Helm Charts

欢迎访问云纳公共镜像的Helm Charts仓库。这里提供了我们维护的各种应用的Helm Charts。

## 可用Charts

### Minecraft 服务器

云纳维护的Minecraft服务器Helm Chart，基于itzg/minecraft-server镜像。

[查看Minecraft Chart详情](./charts/minecraft.html)

## 使用方法

添加仓库:

```bash
helm repo add yunna-charts https://YOUR-GITHUB-USERNAME.github.io/REPO-NAME/
helm repo update
```

安装Chart:

```bash
helm install my-release yunna-charts/minecraft
```

## 贡献指南

如果您想为我们的Charts仓库做出贡献，请查看[贡献指南](./contribute.html)。 