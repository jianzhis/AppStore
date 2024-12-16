# Ubuntu-SSH

## 介绍
一个基于 Ubuntu 的 Helm Chart，内置 SSH 服务及基本工具。

## 主要功能
- 提供 SSH 服务
- 预装基础工具
- 可配置环境变量和持久化存储

## 配置参数说明
| 参数名称                | 描述           | 类型    | 默认值                |
|---------------------|--------------|-------|---------------------|
| `replicaCount`      | 副本数量        | integer | 1                   |
| `image.repository`  | 镜像名称        | string  | ubuntu/ssh-tools    |
| `image.tag`         | 镜像标签        | string  | latest              |
| `service.port`      | 服务端口        | integer | 22                  |

## 部署步骤
1. 克隆仓库
2. 使用 `helm install` 部署

## 使用说明
默认 SSH 端口为 22，请根据需求自定义配置。

## 修改密码
1. 使用 SSH 登录到容器：
   ```bash
   ssh root@<您的容器IP> -p 22
2. 默认密码：
   ```bash
   Password: yunna
   ```
3. 修改密码：
   ```bash
   passwd root
   输入新密码两次后，即可修改密码。
   ```