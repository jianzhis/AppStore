# Oracle Database Helm Chart

## 简介

Oracle Database 是一个功能强大的企业级关系型数据库管理系统,提供了全面的数据管理解决方案。本 Chart 提供单实例部署方案。

### 主要特性

- 企业级数据库功能
- 高性能事务处理
- 完整的数据安全保护
- 强大的管理工具

## 配置参数说明

### 基础配置

| 参数名称 | 描述 | 默认值 |
|---------|------|--------|
| replicaCount | 副本数量 | 1 |
| image.repository | 镜像名称 | oracle/database |
| image.tag | 镜像标签 | 19.3.0-ee |

### Oracle 特定配置 

| 参数名称 | 描述 | 默认值 |
|---------|------|--------|
| oracle.sid | Oracle SID | ORCLCDB |
| oracle.pdbName | PDB 名称 | ORCLPDB1 |
| oracle.sysPassword | SYS 用户密码 | Welcome1 |

### 资源配置

| 参数名称 | 描述 | 默认值 |
|---------|------|--------|
| resources.limits.cpu | CPU 限制 | 2000m |
| resources.limits.memory | 内存限制 | 4Gi |
| resources.requests.cpu | CPU 请求 | 1000m |
| resources.requests.memory | 内存请求 | 2Gi |

## 部署说明

1. 确保集群资源充足
2. 配置持久化存储
3. 设置必要的环境变量
4. 部署应用并等待就绪

## 访问数据库

```bash
sqlplus sys/<password>@<service-name>:1521/<sid> as sysdba