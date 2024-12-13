# Ubuntu SSH

## 介绍
这是一个基于官方Ubuntu镜像的SSH服务器Helm Chart。支持多个Ubuntu版本(20.04/22.04/23.04)，并预装了OpenSSH服务器。

## 主要功能
- 支持多个Ubuntu LTS版本
- 可配置root用户访问权限
- 支持创建额外的SSH用户
- 支持自定义SSH配置
- 数据持久化
- 可安装额外软件包

## 配置参数说明
| 参数名称 | 描述 | 类型 | 默认值 |
|---------|-----|------|--------|
| `global.ubuntuVersion` | Ubuntu版本 | string | `22.04` |
| `env.env1.value` | Root用户密码 | string | `changeme` |
| `env.env2.value` | SSH端口 | string | `22` |
| `env.env3.value` | 允许Root登录 | string | `true` |
| `service.nodePort` | SSH服务端口 | int | `30022` |
| `persistence.enabled` | 启用持久化 | bool | `true` |
| `persistence.size` | 存储大小 | string | `10Gi` |
| `advanced.extraPackages` | 额外安装的包 | list | `[]` |

## 部署步骤
1. 使用默认配置安装
```bash
helm install ubuntu-ssh . 
```

2. 自定义配置安装
```bash
helm install ubuntu-ssh . \
  --set global.ubuntuVersion=22.04 \
  --set env.env1.value=your-secure-password \
  --set env.env3.value=true
```

3. 添加额外用户
```bash
helm install ubuntu-ssh . \
  --set ssh.extraUsers[0].username=devuser \
  --set ssh.extraUsers[0].password=devpass
```

## 使用说明
1. 获取SSH服务地址
```bash
kubectl get svc ubuntu-ssh
```

2. SSH连接
```bash
# 使用root用户
ssh root@<node-ip> -p <nodePort>

# 使用其他用户
ssh <username>@<node-ip> -p <nodePort>
```

## 故障排除
1. SSH连接被拒绝
- 检查服务是否正常运行: `kubectl get pods`
- 检查日志: `kubectl logs <pod-name>`
- 验证密码是否正确设置
- 确认SSH配置是否正确

2. 持久化数据问题
- 检查PVC状态: `kubectl get pvc`
- 确认StorageClass可用
- 检查存储空间是否足够

3. 性能问题
- 检查资源使用情况: `kubectl top pod`
- 调整资源限制
- 检查系统日志

4. 安全问题
- 定期更新密码
- 限制root登录
- 配置SSH密钥认证
- 使用安全组限制访问