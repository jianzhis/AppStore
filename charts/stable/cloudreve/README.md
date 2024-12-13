<h1 align="center">
  <br>
  <a href="https://cloudreve.org/" alt="logo" ><img src="https://raw.githubusercontent.com/cloudreve/frontend/master/public/static/img/logo192.png" width="150"/></a>
  <br>
  Cloudreve
  <br>
</h1>

<h4 align="center">支持多种云存储驱动的公有云文件系统</h4>

<p align="center">
  <a href="https://github.com/cloudreve/Cloudreve/actions/workflows/test.yml">
    <img src="https://img.shields.io/github/actions/workflow/status/cloudreve/Cloudreve/test.yml?branch=master&style=flat-square"
         alt="GitHub Test Workflow">
  </a>
  <a href="https://codecov.io/gh/cloudreve/Cloudreve">
    <img src="https://img.shields.io/codecov/c/github/cloudreve/Cloudreve?style=flat-square">
  </a>
  <a href="https://goreportcard.com/report/github.com/cloudreve/Cloudreve">
      <img src="https://goreportcard.com/badge/github.com/cloudreve/Cloudreve?style=flat-square">
  </a>
  <a href="https://github.com/cloudreve/Cloudreve/releases">
    <img src="https://img.shields.io/github/v/release/cloudreve/Cloudreve?include_prereleases&style=flat-square" />
  </a>
  <a href="https://hub.docker.com/r/cloudreve/cloudreve">
     <img src="https://img.shields.io/docker/image-size/cloudreve/cloudreve?style=flat-square"/>
  </a>
</p>

<p align="center">
  <a href="https://cloudreve.org">主页</a> •
  <a href="https://demo.cloudreve.org">演示站</a> •
  <a href="https://forum.cloudreve.org/">讨论社区</a> •
  <a href="https://docs.cloudreve.org/">文档</a> •
  <a href="https://github.com/cloudreve/Cloudreve/releases">下载</a> •
  <a href="https://t.me/cloudreve_official">Telegram 群组</a> •
  <a href="#scroll-许可证">许可证</a>
</p>

![Screenshot](https://raw.githubusercontent.com/cloudreve/docs/master/images/homepage.png)

## ✨ 特性

- ☁️ 支持多种存储后端：本地存储、七牛云、阿里云 OSS、腾讯云 COS、又拍云、OneDrive（包括世纪互联版）、S3 兼容存储
- 📤 上传/下载支持客户端直传，支持限速功能
- 💾 支持 Aria2 离线下载，多节点分担下载任务
- 📚 在线压缩/解压、多文件打包下载
- 💻 完整的 WebDAV 支持
- ⚡ 拖拽上传、目录上传及流式上传处理
- 🗂️ 文件拖拽管理
- 👥 多用户、用户组管理与多存储策略支持
- 🔗 文件/目录分享功能，可设定自动过期
- 👁️‍🗨️ 在线预览视频、图片、音频、ePub，支持文本、Office 文档在线编辑
- 🎨 支持自定义配色、黑暗模式、PWA 应用、全站单页应用及国际化
- 🚀 All-In-One 打包，开箱即用
- 🌈 其他更多特性...

## 🛠️ 部署

下载适合您操作系统和 CPU 架构的主程序，并按照以下步骤运行：

```bash
# 解压程序包
tar -zxvf cloudreve_VERSION_OS_ARCH.tar.gz

# 赋予执行权限
chmod +x ./cloudreve

# 启动 Cloudreve
./cloudreve
```

详细的部署步骤请参考 [文档 - 起步](https://docs.cloudreve.org/)。

## ⚙️ 构建

如果您希望自行构建 Cloudreve，需要确保安装了以下依赖：`Go >= 1.18`、`Node.js`、`Yarn`、`Zip`、[Goreleaser](https://goreleaser.com/intro/)。

### 安装 Goreleaser

```bash
go install github.com/goreleaser/goreleaser@latest
```

### 克隆代码

```bash
git clone --recurse-submodules https://github.com/cloudreve/Cloudreve.git
```

### 编译项目

```bash
goreleaser build --clean --single-target --snapshot
```

## ⚗️ 技术栈

- 后端: [Go](https://golang.org/) + [Gin](https://github.com/gin-gonic/gin)
- 前端: [React](https://github.com/facebook/react) + [Redux](https://github.com/reduxjs/redux) + [Material-UI](https://github.com/mui-org/material-ui)

## 📜 许可证

Cloudreve 基于 GPL V3 许可证发布。