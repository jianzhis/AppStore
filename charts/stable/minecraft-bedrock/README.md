# Minecraft 基岩版服务器

[![Docker Pulls](https://img.shields.io/docker/pulls/itzg/minecraft-bedrock-server.svg)](https://hub.docker.com/r/itzg/minecraft-bedrock-server/)
[![Docker Stars](https://img.shields.io/docker/stars/itzg/minecraft-bedrock-server.svg?maxAge=2592000)](https://hub.docker.com/r/itzg/minecraft-bedrock-server/)
[![GitHub Issues](https://img.shields.io/github/issues-raw/itzg/docker-minecraft-bedrock-server.svg)](https://github.com/itzg/docker-minecraft-bedrock-server/issues)

## 简介

Minecraft基岩版服务器支持手机、平板、游戏主机和Windows 10/11等多平台玩家一起游戏。该服务器基于官方基岩版服务器构建，提供跨平台的多人游戏体验。

## 功能特点

- **跨平台游戏**: 支持手机、平板、Xbox、PlayStation和Windows商店版本玩家一起游戏
- **自定义设置**: 可配置服务器名称、游戏模式、难度等多种设置
- **世界管理**: 支持自定义世界名称和种子，以及地图的保存与恢复
- **插件支持**: 可安装行为包和资源包，扩展游戏功能
- **性能优化**: 通过配置视距和刻距离等参数优化服务器性能
- **权限管理**: 提供访客、成员和管理员多级权限控制

## 服务器设置

服务器支持多种环境变量配置：

- `SERVER_NAME`: 服务器名称，显示在服务器列表中
- `GAMEMODE`: 游戏模式，可选survival（生存）、creative（创造）或adventure（冒险）
- `DIFFICULTY`: 游戏难度，可选peaceful、easy、normal或hard
- `ALLOW_CHEATS`: 是否允许使用作弊命令
- `MAX_PLAYERS`: 最大玩家数量
- `VIEW_DISTANCE`: 视距，控制玩家可见范围
- `LEVEL_NAME`: 世界名称
- `DEFAULT_PLAYER_PERMISSION_LEVEL`: 默认玩家权限级别

## 系统要求

- 建议至少1GB内存用于小型服务器（<5玩家）
- 中大型服务器(10+玩家)建议2GB或更多内存
- 存储空间视世界大小而定，建议至少8GB

## 更多信息

- 官方文档：[Minecraft 基岩版官网](https://www.minecraft.net/bedrock)
- 服务器参考：[Bedrock服务器配置指南](https://www.minecraft.net/download/server/bedrock) 