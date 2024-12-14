# 云纳 Helm Charts 贡献指南

欢迎来到云纳 Helm Charts 仓库！我们很高兴您想要参与贡献。这份文档将指导您如何为项目贡献代码和应用。

## 快速开始

1. Fork 本仓库
2. 克隆您的 Fork 仓库:
```bash
git clone https://github.com/YOUR_USERNAME/TestMirror.git
cd TestMirror
```

3. 添加上游仓库:
```bash
git remote add upstream https://github.com/jianzhis/TestMirror.git
```

## 开发流程

### 1. 选择任务
- 查看 Issues 列表，寻找感兴趣的任务
- 创建新的 Issue 描述您想要添加的功能或修复
- 在 Issue 中讨论实现方案

### 2. 创建分支
```bash
git checkout -b feat/chart-name  # 新功能分支
git checkout -b fix/chart-name   # 修复分支
```

### 3. 开发规范

#### Chart 目录结构
```
charts/stable/[chart-name]/
├── Chart.yaml          # Chart 基本信息
├── README.md          # 使用文档
├── values.schema.json  # 值验证模式
├── values.yaml        # 默认配置值
└── templates/         # 模板目录
```

#### 开发步骤
1. 参考 [Chart 开发规范](./charts/STANDARDS.md)
2. 使用 template-app 作为基础模板
3. 完善所有必需文件
4. 本地测试验证

### 4. 测试验证

在提交之前，请确保：

1. Chart 打包测试:
```bash
helm package charts/stable/your-chart
```

2. Chart 安装测试:
```bash
helm install test-release charts/stable/your-chart
```

3. Lint 检查:
```bash
helm lint charts/stable/your-chart
```

### 5. 提交变更

#### Commit 规范
```
feat(chart-name): add new chart for application
fix(chart-name): fix deployment issue
docs(chart-name): update documentation
```

#### 提交过程
```bash
git add .
git commit -m "feat(chart-name): add new chart"
git push origin feat/chart-name
```

### 6. 发起 Pull Request

1. 通过 GitHub 创建 Pull Request
2. 填写 PR 模板中的所有必需信息
3. 等待 CI 检查和审核
4. 根据反馈进行修改

## 版本规范

### Chart 版本号
- 遵循语义化版本 (Semantic Versioning)
- 格式: MAJOR.MINOR.PATCH
- 示例: 1.0.0, 1.0.1, 1.1.0

### 发布流程
1. 测试分支：提交到 test 分支进行测试
2. 正式发布：合并到 main 分支

## 文档要求

### README.md 必需内容
- 应用介绍
- 前置条件
- 安装步骤
- 配置参数
- 使用示例
- 注意事项

### Commit 信息格式
```
<type>(<scope>): <subject>

<body>

<footer>
```

Type 类型:
- feat: 新功能
- fix: 修复
- docs: 文档
- style: 格式
- refactor: 重构
- test: 测试
- chore: 其他

## 审核流程

1. 提交检查
- 文件完整性
- 代码规范性
- 版本正确性

2. 功能验证
- 部署测试
- 功能测试
- 性能测试

3. 文档审核
- 文档完整性
- 示例正确性
- 说明清晰性

## 社区参与

### 获取帮助
- 提交 Issue
- 加入社区讨论
- 参与技术交流

### 反馈问题
- 描述清楚问题现象
- 提供复现步骤
- 附带相关日志

## 奖励机制

为了鼓励社区贡献，我们提供：

1. 积分奖励
- 提交 Chart: 2000积分
- 修复 Bug: 500积分
- 完善文档: 500积分

2. 开发者等级
- 普通开发者: >1000积分
- 高级开发者: >5000积分
- 专家开发者: >10000积分

3. 权益说明
- 免费使用时长
- 技术支持特权
- 社区荣誉标识

感谢您的贡献！