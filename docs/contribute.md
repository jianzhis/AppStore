---
layout: default
title: 贡献指南
---

# 贡献指南

感谢您对云纳Helm Charts仓库的关注！我们欢迎各种形式的贡献，包括但不限于添加新Chart、改进现有Chart、文档更新等。

## 贡献流程

1. Fork本仓库
2. 创建您的功能分支 (`git checkout -b feature/amazing-feature`)
3. 提交您的更改 (`git commit -m 'Add some amazing feature'`)
4. 推送到分支 (`git push origin feature/amazing-feature`)
5. 打开Pull Request

## Chart开发指南

### 基本要求

所有Chart必须：
- 包含完整的README.md文档
- 包含values.yaml和values.schema.json
- 通过helm lint测试
- 使用registry-2.yunna.net作为镜像仓库地址
- 包含必要的资源限制配置
- 包含持久化配置
- 包含健康检查

### 文件结构

```
charts/stable/my-chart/
├── Chart.yaml
├── values.yaml
├── values.schema.json
├── README.md
└── templates/
    ├── deployment.yaml
    ├── service.yaml
    ├── _helpers.tpl
    └── (其他模板文件)
```

### values.schema.json指南

为了提供更好的用户体验，每个Chart都必须包含values.schema.json文件，用于验证配置并提供UI支持。

示例：
```json
{
  "$schema": "http://json-schema.org/schema#",
  "type": "object",
  "required": ["image"],
  "properties": {
    "image": {
      "type": "object",
      "required": ["repository"],
      "properties": {
        "repository": {
          "type": "string",
          "title": "镜像名称"
        }
      }
    }
  }
}
```

## 代码审查流程

所有的Pull Request都将由我们的团队进行审查，我们会检查：

1. Chart结构是否符合标准
2. 文档是否完整
3. 资源配置是否合理
4. 是否通过CI/CD检查

## 联系我们

如有任何问题，请通过Issues与我们联系。 