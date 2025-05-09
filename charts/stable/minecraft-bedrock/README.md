[![Docker Pulls](https://img.shields.io/docker/pulls/itzg/minecraft-bedrock-server.svg)](https://hub.docker.com/r/itzg/minecraft-bedrock-server/)
[![GitHub Issues](https://img.shields.io/github/issues-raw/itzg/docker-minecraft-bedrock-server.svg)](https://github.com/itzg/docker-minecraft-bedrock-server/issues)
[![Build](https://github.com/itzg/docker-minecraft-bedrock-server/workflows/CI/badge.svg)](https://github.com/itzg/docker-minecraft-bedrock-server/actions?query=workflow%3ACI)
[![Discord](https://img.shields.io/discord/660567679458869252?label=Discord&logo=discord)](https://discord.gg/ScbTrAw)
[![](https://img.shields.io/badge/Donate-Buy%20me%20a%20coffee-orange.svg)](https://www.buymeacoffee.com/itzg)

## 快速开始

以下命令启动运行默认版本的 Bedrock 专用服务器并暴露默认UDP端口：

```bash
docker run -d -it -e EULA=TRUE -p 19132:19132/udp -v mc-bedrock-data:/data itzg/minecraft-bedrock-server
```

> **注意**：如果你计划长时间运行服务器，强烈建议使用如 [Docker Compose](#使用docker-compose部署) 或 [Kubernetes](#使用kubernetes部署) 等管理层，以便进行增量重新配置和镜像升级。

## 升级到最新的 Bedrock 服务器版本

将 `VERSION` 变量设置为 "LATEST"（这是默认值），Bedrock 服务器可以通过重启容器进行升级。每次启动时，容器都会检查最新版本并在需要时进行升级。

可以通过将 `VERSION` 设置为 "PREVIEW" 来请求最新的预览版本。

## 寻找 Java 版服务器

对于 Minecraft Java 版，你需要使用这个镜像：

[itzg/minecraft-server](https://hub.docker.com/r/itzg/minecraft-server)

## 环境变量

### 容器特定

- `EULA`（无默认值）：必须设置为 `TRUE` 以接受 [Minecraft 最终用户许可协议](https://minecraft.net/terms)
- `VERSION`（默认为 `LATEST`）：可以设置为特定服务器版本或使用以下特殊值：
  - `LATEST`：确定最新（非预览）版本，可用于容器启动时自动升级
  - `PREVIEW`：确定最新预览版本并将自动升级
  - 否则可以提供任何特定的服务器版本。如果是预览版本，还需将 `PREVIEW` 设置为 "true"
- `UID`（默认从 `/data` 所有者派生）：可以设置为特定用户 ID 以运行 bedrock 服务器进程
- `GID`（默认从 `/data` 所有者派生）：可以设置为特定组 ID 以运行 bedrock 服务器进程
- `TZ`（无默认值）：可以设置为特定时区，如 `America/New_York`。这将设置 Docker 容器的时区及其日志。此外，如果要与主机同步时间，可以通过 `/etc/localtime:/etc/localtime:ro` 将主机的 `/etc/localtime` 文件挂载到容器中。
- `PACKAGE_BACKUP_KEEP`（`2`）：保留多少个包备份

### 服务器属性

以下环境变量将在 `server.properties` 中设置等效属性，每个属性的[描述在这里](https://minecraft.wiki/w/Server.properties#Option_keys)。通常，每个属性都是通过等效的大写下划线命名方式（UPPER_SNAKE_CASE）配置的。

- `SERVER_NAME`
- `GAMEMODE`
- `FORCE_GAMEMODE`
- `DIFFICULTY`
- `ALLOW_CHEATS`
- `MAX_PLAYERS`
- `ONLINE_MODE`
- `WHITE_LIST`
- `ALLOW_LIST`
- `SERVER_PORT`
- `SERVER_PORT_V6`
- `ENABLE_LAN_VISIBILITY`
- `VIEW_DISTANCE`
- `TICK_DISTANCE`
- `PLAYER_IDLE_TIMEOUT`
- `MAX_THREADS`
- `LEVEL_NAME`
- `LEVEL_SEED`
- `LEVEL_TYPE`
- `DEFAULT_PLAYER_PERMISSION_LEVEL`
- `TEXTUREPACK_REQUIRED`
- `CONTENT_LOG_FILE_ENABLED`
- `CONTENT_LOG_LEVEL`
- `CONTENT_LOG_CONSOLE_OUTPUT_ENABLED`
- `COMPRESSION_THRESHOLD`
- `COMPRESSION_ALGORITHM`
- `SERVER_AUTHORITATIVE_MOVEMENT`
- `PLAYER_POSITION_ACCEPTANCE_THRESHOLD`
- `PLAYER_MOVEMENT_SCORE_THRESHOLD`
- `PLAYER_MOVEMENT_ACTION_DIRECTION_THRESHOLD`
- `PLAYER_MOVEMENT_DISTANCE_THRESHOLD`
- `PLAYER_MOVEMENT_DURATION_THRESHOLD_IN_MS`
- `CORRECT_PLAYER_MOVEMENT`
- `SERVER_AUTHORITATIVE_BLOCK_BREAKING`
- `SERVER_AUTHORITATIVE_BLOCK_BREAKING_PICK_RANGE_SCALAR`
- `CHAT_RESTRICTION`
- `DISABLE_PLAYER_INTERACTION`
- `CLIENT_SIDE_CHUNK_GENERATION_ENABLED`
- `BLOCK_NETWORK_IDS_ARE_HASHES`
- `DISABLE_PERSONA`
- `DISABLE_CUSTOM_SKINS`
- `SERVER_BUILD_RADIUS_RATIO`
- `ALLOW_OUTBOUND_SCRIPT_DEBUGGING`
- `ALLOW_INBOUND_SCRIPT_DEBUGGING`
- `FORCE_INBOUND_DEBUG_PORT`
- `SCRIPT_DEBUGGER_AUTO_ATTACH`
- `SCRIPT_DEBUGGER_AUTO_ATTACH_CONNECT_ADDRESS`
- `SCRIPT_WATCHDOG_ENABLE`
- `SCRIPT_WATCHDOG_ENABLE_EXCEPTION_HANDLING`
- `SCRIPT_WATCHDOG_ENABLE_SHUTDOWN`
- `SCRIPT_WATCHDOG_HANG_EXCEPTION`
- `SCRIPT_WATCHDOG_HANG_THRESHOLD`
- `SCRIPT_WATCHDOG_SPIKE_THRESHOLD`
- `SCRIPT_WATCHDOG_SLOW_THRESHOLD`
- `SCRIPT_WATCHDOG_MEMORY_WARNING`
- `SCRIPT_WATCHDOG_MEMORY_LIMIT`
- `OP_PERMISSION_LEVEL`
- `EMIT_SERVER_TELEMETRY`
- `MSA_GAMERTAGS_ONLY`
- `ITEM_TRANSACTION_LOGGING_ENABLED`
- `VARIABLES`

例如，要配置一个平坦的创造模式服务器而不是默认服务器，请使用：

```bash
docker run -d -it --name bds-flat-creative \
  -e EULA=TRUE -e LEVEL_TYPE=flat -e GAMEMODE=creative \
  -p 19132:19132/udp itzg/minecraft-bedrock-server
```

## 暴露的端口

- **UDP** 19132：由 `SERVER_PORT` 设置的 IPv4 上的 Bedrock 服务器端口。默认情况下不暴露 IPv6 端口。
  **注意**：暴露端口时必须附加 `/udp`，例如 `-p 19132:19132/udp`，且主机上必须启用 IPv4 和 IPv6。

## 卷

- `/data`：下载的服务器展开和运行的位置。也包含配置属性文件 `server.properties`

你可以创建一个`命名卷`并按如下方式使用：

```shell
docker volume create mc-volume
docker run -d -it --name mc-server -e EULA=TRUE -p 19132:19132/udp -v mc-volume:/data itzg/minecraft-bedrock-server
```

如果你使用命名卷并希望 bedrock 进程以非 root 用户身份运行，则需要预先创建卷并将其 `chown` 给所需用户。

例如，如果你希望 bedrock 服务器以用户 ID 1000 和组 ID 1000 运行，则使用以下命令创建并 chown 名为 "bedrock" 的卷：

```shell script
docker run --rm -v bedrock:/data alpine chown 1000:1000 /data
```

如果使用 `docker run`，则只需在 `-v` 参数中引用该 "bedrock" 卷。如果使用 compose 文件，则将卷声明为使用此类声明的外部卷：

```yaml
volumes:
  bedrock:
    external:
      name: bedrock
```

## 连接

当在你的局域网上运行容器时，你可以在"好友"选项卡的"局域网游戏"部分找到并连接到专用服务器，例如：

![](docs/example-client.jpg)

## 权限

Bedrock 专用服务器要求使用 XUID 定义权限。有各种在线工具可以查找这些 XUID，当玩家加入时它们也会打印到日志中。有 3 个权限级别和 3 个选项来配置每个组：

- `OPS` 用于定义服务器上的操作员。
```shell
-e OPS="1234567890,0987654321"
```
- `MEMBERS` 用于定义服务器上的成员。
```shell
-e MEMBERS="1234567890,0987654321"
```
- `VISITORS` 用于定义服务器上的访客。
```shell
-e VISITORS="1234567890,0987654321"
```

## 允许名单

有两种处理白名单的方式：

第一种是将 `ALLOW_LIST` 环境变量设置为 true，并映射一个自定义制作的 [allowlist.json](https://minecraft.wiki/w/Whitelist.json) 文件（之前称为 "whitelist.json"）到容器。

另一种是将 `ALLOW_LIST_USERS` 环境变量设置为游戏玩家标签用户名及其相应 XUID 的逗号分隔列表。每个用户名后面应跟其 XUID，用冒号分隔。服务器将使用这些详细信息来匹配玩家。

有各种在线工具可以查找 XUID，当玩家加入服务器时，它们也会打印到日志中。

```shell
-e ALLOW_LIST_USERS="player1:1234567890,player2:0987654321"
```

## 变量

Bedrock 支持自定义服务器变量。详细信息和使用说明可在以下官方 bedrock 文档中找到：

- [变量和密钥 - Minecraft 创建者文档](https://learn.microsoft.com/en-us/minecraft/creator/documents/scriptingservers?view=minecraft-bedrock-stable#variables-and-secrets)
- [变量和密钥 - minecraft/server-admin 示例](https://learn.microsoft.com/en-us/minecraft/creator/scriptapi/minecraft/server-admin/serversecrets?view=minecraft-bedrock-experimental#getplayerprofilets-1)

自定义服务器变量以逗号分隔的简单键值对或完整 JSON 字符串的形式传入。

服务器变量会解析为最可能的类型（类似数字的转换为数字，所有其他输入都被视为字符串），使用 [jq 的 `fromjson` 命令](https://jqlang.github.io/jq/manual/#convert-to-from-json)。在下面的示例中，`var1` 是字符串，`var2` 是数字，`var3` 是字符串。

为了更好地控制类型，用户可以提供完整的字符串 JSON 表示，该表示按原样使用。

所有变量都写入位于 `config/default/variables.json` 的变量文件中。目前不支持模块特定的变量处理。

```shell
# 传入简单表达式
-e VARIABLES="var1=customStringValue,var2=1234,var3=true"

# 传入完整的 json 对象：
-e VARIABLES='{"mobSpawnRate":22,"enableCheats":true,"worldArray":["My World", "Abc", 123]}'
```

## 模组插件

也称为行为包或资源包，要将模组添加到服务器中，你可以按照以下步骤操作，已使用 [OPS (One Player Sleep)](https://foxynotail.com/addons/ops/) 和 [bedrocktweaks](https://bedrocktweaks.net/resource-packs/) 测试过：

1. 首先在客户端上安装 mcpack 或 mcaddon，这样可以更容易地将文件复制到服务器，对于 Windows 10，文件应位于 `C:\Users\USER\AppData\Local\Packages\Microsoft.MinecraftUWP_*\LocalState\games\com.mojang`。
2. 将模组文件夹从 behavior_packs 或 resource_packs 复制到服务器的卷中。
> 如果你想在不使用客户端的情况下安装它们，你应该能够将模组直接解压到服务器的卷中，.mcaddon 应该放入 behavior_packs，.mcpack 应该放入 resource_packs。.mcaddon 和 .mcpack 实际上都是重命名的 .zip 文件。
3. 最后在服务器的卷上创建 `worlds/$level-name/world_behavior_packs.json`，你需要为每个模组添加一个条目，就像之前的 manifest.json 一样，我们现在只需要 uuid（现在称为 pack_id）和版本（用逗号替换点，用 [ ] 替换双引号）。
> 你也可以创建 `worlds/$level-name/world_resource_packs.json`，但我已经发现将资源包和行为包都放在同一个 json 中也完全有效。
```
[
	{
		"pack_id" : "5f51f7b7-85dc-44da-a3ef-a48d8414e4d5",
		"version" : [ 3, 0, 0 ]
	}
]
```
4. 重启服务器，模组现在应该已启用！连接时，你会收到一个提示，询问你是否要"下载并加入"或只是"加入"，如果你想实际看到添加到服务器的新资源包，你需要选择下载并加入。
此提示仅适用于资源包，因为这些会改变 Minecraft 的外观，而行为包会改变 Minecraft 的功能，不需要在客户端下载或安装。
> 如果你想强制所有客户端使用资源包，`server.properties` 中有一个选项 `texturepack-required=false`，应该改为 `true`。
> 可以通过进入设置 > 存储 > 缓存数据，然后选择包并点击垃圾桶图标来删除资源包。

有关更多信息，[FoxyNoTail](https://www.youtube.com/watch?v=nWBM4UFm0rQ&t=1380s) 制作了一个视频，在运行 Windows 的服务器上解释了同样的内容。

## 更多信息

有关一般管理 Bedrock 专用服务器的更多信息，[查看这个 Reddit 帖子](https://old.reddit.com/user/ProfessorValko/comments/9f438p/bedrock_dedicated_server_tutorial/)。

## 执行服务器命令

此镜像附带一个名为 `send-command` 的脚本，它将 Bedrock 命令和参数发送到 Bedrock 服务器控制台。命令的输出只会在容器日志中可见。

例如：

```
docker exec 容器名称或ID send-command gamerule dofiretick false
```

或者，在启用了 stdin 和 tty 的情况下（例如使用 `-it`），使用以下方式通过其名称或 ID 附加到容器的控制台：

```shell script
docker attach 容器名称或ID
```

附加时，你可以执行任何服务器端命令，例如将你的玩家设为管理员：

```
gamerule dofiretick false
```

完成后，使用 Ctrl-p, Ctrl-q 从服务器控制台分离。

## 使用Docker Compose部署

[examples](examples) 目录包含[一个Docker compose示例文件](examples/docker-compose.yml)，其中声明了：
- 一个运行bedrock服务器容器并暴露UDP端口19132的服务。在示例中命名为"bds"，是"Bedrock Dedicated Server"的缩写，但你可以随意命名这个服务
- 一个挂载到容器路径 `/data` 的卷

```yaml
services:
  bds:
    image: itzg/minecraft-bedrock-server
    environment:
      EULA: "TRUE"
    ports:
      - "19132:19132/udp"
    volumes:
      - ./data:/data
    stdin_open: true
    tty: true
```

使用以下命令启动服务器并在后台运行：

```bash
docker compose up -d
```

你可以随时使用以下命令查看日志：

```bash
docker compose logs -f
```

## 使用Kubernetes部署

[examples](examples) 目录包含[一个Kubernetes清单示例文件](examples/kubernetes.yml)，其中声明了：
- 一个持久卷声明（使用默认存储类）
- 一个使用声明的PVC的pod部署
- 一个LoadBalancer类型的服务

pod部署包含一些通过环境变量配置服务器属性的示例：
```yaml
env:
- name: EULA
  value: "TRUE"
- name: GAMEMODE
  value: survival
- name: DIFFICULTY
  value: normal
```

该文件可以在大多数集群上按原样部署，但已在[Docker for Desktop](https://docs.docker.com/docker-for-windows/kubernetes/)和[Google Kubernetes Engine](https://cloud.google.com/kubernetes-engine/docs/)上得到确认：

```bash
kubectl apply -f examples/kubernetes.yml
```

你可以使用以下命令查看部署的日志：

```bash
kubectl logs -f deployment/bds
```

## 社区解决方案

- [kaiede/minecraft-bedrock-backup image](https://hub.docker.com/r/kaiede/minecraft-bedrock-backup) 由 @Kaiede 提供
- [ghcr.io/edward3h/mc-webhook](https://github.com/edward3h/minecraft-webhook) 由 @edward3h 提供
- [Minecraft Bedrock Server Bridge](https://github.com/macchie/minecraft-bedrock-server-bridge) 由 @macchie 提供
- [Admincraft](https://github.com/joanroig/Admincraft) 由 @joanroig 提供

## 教程
[@TheTinkerDad]([url](https://github.com/TheTinkerDad)) 提供了一个很棒的教程，介绍如何在单个端口（19132）上托管多个实例，使其可被发现：https://www.youtube.com/watch?v=ds0_ESzjbfs

## 贡献

> 在尝试构建此Docker镜像时，请确保所有 `.sh` 文件的行尾序列为 `LF` 而不是 `CLRF`，否则构建将失败。