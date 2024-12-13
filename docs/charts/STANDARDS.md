# 云纳 Helm Chart 开发规范 v1.0

## 目录结构
```bash
charts/stable/[chart-name]/
├── Chart.yaml            # Chart 基本信息
├── README.md            # 使用文档
├── values.schema.json   # 参数校验
├── values.yaml          # 默认配置
└── templates/           # 模板文件
    ├── deployment.yaml      # 应用部署配置
    ├── service.yaml         # 服务配置
    ├── pvc.yaml            # 可选：持久化存储
    └── _helpers.tpl        # 通用函数
```

## Chart.yaml 规范

必需字段和格式：
```yaml
apiVersion: v2
name: [name]                    # 应用名称，如 uptime-kuma
description: |                  # 必须用中文描述
  [应用介绍，需要详细说明功能和用途]
version: 0.1.0                 # Chart 版本
appVersion: "latest"           # 应用版本
home: https://project.com      # 项目主页
sources:                       # 源码仓库
  - https://github.com/xxx/xxx
maintainers:                   # 维护者
  - name: "作者"
    email: "邮箱"
annotations:                   # 云纳分类(必填)
  "yunna.net/category": "类别"  # 英文类别
  "yunna.net/category-zh": "类别" # 中文类别
keywords:                      # 搜索关键词
  - keyword1
  - keyword2
icon: "图标URL"                # 可选：应用图标
```

## values.yaml 规范

### 基础配置
```yaml
replicaCount: 1               # 副本数量

image:
  imageRegistry: "registry-2.yunna.net"  # 镜像仓库
  repository: vendor/app      # 镜像名称
  tag: "latest"              # 镜像标签
  pullPolicy: IfNotPresent   # 拉取策略

service:
  type: ClusterIP            # 服务类型
  port: 3001                 # 服务端口
```

### 资源配置
```yaml
resources:                    # 资源限制和请求
  limits:
    cpu: 1000m
    memory: 1024Mi
  requests:
    cpu: 500m
    memory: 512Mi

persistence:                  # 持久化配置
  enabled: true
  accessMode: ReadWriteOnce
  size: 1Gi
  storageClass: "local"      # 存储类

env:                         # 环境变量
  env1:
    name: ENV_NAME
    value: env_value
```

## values.schema.json 规范

```json
{
  "$schema": "http://json-schema.org/schema#",
  "type": "object",
  "properties": {
    "replicaCount": {
      "type": "integer",
      "title": "副本数量",
      "description": "要部署的副本数量",
      "minimum": 1,
      "default": 1
    },
    "resources": {
      "type": "object",
      "title": "资源需求",
      "properties": {
        "limits": {
          "type": "object",
          "title": "资源限制",
          "properties": {
            "cpu": {
              "type": "string",
              "title": "CPU限制",
              "pattern": "^[0-9]+m?$",
              "default": "1000m"
            },
            "memory": {
              "type": "string",
              "title": "内存限制",
              "pattern": "^[0-9]+(Mi|Gi)$",
              "default": "1024Mi"
            }
          }
        },
        "requests": {
          "type": "object",
          "title": "资源请求",
          "properties": {
            "cpu": {
              "type": "string",
              "title": "CPU请求",
              "pattern": "^[0-9]+m?$",
              "default": "500m"
            },
            "memory": {
              "type": "string",
              "title": "内存请求",
              "pattern": "^[0-9]+(Mi|Gi)$",
              "default": "512Mi"
            }
          }
        }
      }
    },
    "persistence": {
      "type": "object",
      "title": "持久化配置",
      "properties": {
        "enabled": {
          "type": "boolean",
          "title": "启用持久化",
          "default": true
        },
        "accessMode": {
          "type": "string",
          "title": "访问模式",
          "enum": ["ReadWriteOnce", "ReadOnlyMany", "ReadWriteMany"],
          "default": "ReadWriteOnce"
        },
        "size": {
          "type": "string",
          "title": "存储大小",
          "pattern": "^[0-9]+(Mi|Gi)$",
          "default": "1Gi"
        },
        "storageClass": {
          "type": "string",
          "title": "存储类",
          "default": "local"
        }
      }
    },
    "env": {
      "type": "object",
      "title": "环境变量",
      "properties": {
        "env1": {
          "type": "object",
          "title": "环境变量1",
          "properties": {
            "name": {
              "type": "string",
              "title": "变量名称",
              "default": "NODE_ENV"
            },
            "value": {
              "type": "string",
              "title": "变量值",
              "default": "production"
            }
          }
        },
        "env2": {
          "type": "object",
          "title": "环境变量2",
          "properties": {
            "name": {
              "type": "string",
              "title": "变量名称",
              "default": "DEBUG"
            },
            "value": {
              "type": "string",
              "title": "变量值",
              "default": "false"
            }
          }
        }
      }
    }
  }
}
```

## 模板文件规范

### deployment.yaml
必需配置：
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: {{ include "[name].fullname" . }}
  labels:
    {{- include "[name].labels" . | nindent 4 }}
spec:
  replicas: {{ .Values.replicaCount }}
  selector:
    matchLabels:
      {{- include "[name].selectorLabels" . | nindent 6 }}
  template:
    spec:
      containers:
        - name: {{ .Chart.Name }}
          image: "{{ .Values.image.imageRegistry }}/{{ .Values.image.repository }}:{{ .Values.image.tag }}"
          resources:
            {{- toYaml .Values.resources | nindent 12 }}
          volumeMounts:            # 如果有持久化需求必须配置
            - name: data
              mountPath: /path
```

### service.yaml
```yaml
apiVersion: v1
kind: Service
metadata:
  name: {{ include "[name].fullname" . }}
  labels:
    {{- include "[name].labels" . | nindent 4 }}
spec:
  type: {{ .Values.service.type }}
  ports:
    - port: {{ .Values.service.port }}
      targetPort: container-port
```

### _helpers.tpl
必需的函数：
```yaml
{{- define "[name].fullname" -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "[name].labels" -}}
app.kubernetes.io/name: {{ include "[name].name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion }}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version }}
{{- end -}}

{{- define "[name].selectorLabels" -}}
app.kubernetes.io/name: {{ include "[name].name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
```

## README.md 规范

必需的章节和格式：

```markdown
# 应用名称

## 介绍
[详细的应用介绍]

## 主要功能
- [功能点列表]

## 配置参数说明
| 参数名称 | 描述 | 类型 | 默认值 |
|---------|-----|------|--------|
| `参数路径` | 参数说明 | 参数类型 | 默认值 |

## 部署步骤
[部署说明]

## 使用说明
[使用方法]

## 故障排除
[常见问题和解决方案]
```

## 测试和检查

1. 本地测试要求
- 确保能正常部署
- 检查资源设置合理性
- 验证基本功能正常

2. 提交前检查
- Chart.yaml 必填项完整
- values.schema.json 校验正确
- README.md 包含所有必需章节
- 所有模板文件语法正确

3. 文档要求
- 所有文档使用中文
- 配置参数有详细说明
- 包含基本的故障排除指南

## 命名规范

1. 目录和文件
- 目录名使用小写字母
- 文件名使用小写字母和横线

2. 变量命名
- 使用驼峰命名法
- 避免使用特殊字符
- 保持命名一致性

## 提交规范

1. 版本号格式
- 遵循语义化版本
- 主版本号.次版本号.修订号

2. 提交信息
- 清晰描述变更内容
- 标注版本号变更
- 说明不兼容变更

3. 更新内容
- 更新 Chart.yaml 版本
- 补充 README 变更说明
- 确保文档同步更新