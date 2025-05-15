# 通用游戏服务器管理容器 Helm Chart

[![GitHub](https://img.shields.io/github/stars/yxsj245/gameserver_container?style=flat-square)](https://github.com/yxsj245/gameserver_container)
[![Docker](https://img.shields.io/docker/pulls/xiaozhu674/gameserver?style=flat-square)](https://hub.docker.com/r/xiaozhu674/gameserver)
[![License](https://img.shields.io/github/license/yxsj245/gameserver_container?style=flat-square)](https://github.com/yxsj245/gameserver_container)

通用游戏服务器管理容器是一个基于Docker且采用debian作为镜像底层的游戏服务器平台，具有非常高的兼容性和拓展性，专为运行各种Steam游戏服务器而设计。它提供了一套完整的内容，让游戏服务器的部署、管理和维护变得简单高效。

## 功能特点

- **一站式游戏服务器部署平台**
  - 预装SteamCMD及其所有依赖，支持32位和64位游戏服务器
  - 交互式终端菜单界面，让服务器管理变得直观简单
  - 开服端口侦听判断是否可以进服
  
- **全面的游戏支持**
  - 内置多款热门游戏服务器的一键部署脚本
  - 支持包括：幻兽帕鲁、方舟生存进化、七日杀、腐蚀、求生之路2等多种游戏
  - 支持通过AppID安装任意Steam游戏服务器

## 快速开始

### 安装

```bash
helm repo add myrepo https://example.com/helm-charts
helm install gameserver myrepo/gameserver
```

### 配置

请参考`values.yaml`文件获取完整的配置选项，以下是常用配置示例：

```bash
helm install gameserver myrepo/gameserver \
  --set service.type=NodePort \
  --set persistence.gameData.size=50Gi \
  --set env.GAME_TO_RUN=Palworld
```

## 支持的游戏

通用游戏服务器支持超过20款游戏的快速部署，包括但不限于：
- 幻兽帕鲁 (Palworld)
- 方舟：生存进化 (ARK: Survival Evolved)
- 七日杀 (7 Days to Die)
- 腐蚀 (Rust)
- 求生之路 2 (Left 4 Dead 2)

## 对接MCSManager面板

本容器支持对接MCSManager面板进行管理，具体步骤请参考[项目文档](http://blogpage.xiaozhuhouses.asia/html4/index.html#/)。

## 社区与支持

- [GitHub 仓库](https://github.com/yxsj245/gameserver_container)
- [文档站](http://blogpage.xiaozhuhouses.asia/html4/index.html#/)
- [bilibili](https://www.bilibili.com/video/BV1YiLqz7EVX/)
- [QQ群](https://qm.qq.com/q/iFTPvgcfDO) 