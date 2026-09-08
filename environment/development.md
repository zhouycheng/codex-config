# 开发与工具能力

以下内容来自 2026 年 9 月 8 日的本机实测。CLI 统计以 `command -v` 能找到入口为准；MCP 统计来自 Codex 桌面版内置 CLI 的配置读取结果。

## 概览

| 类型 | 数量 | 当前状态 |
| --- | ---: | --- |
| CLI 命令 | 95 | 均可在当前 `PATH` 中找到 |
| Codex MCP | 9 | 8 个启用，1 个停用 |
| FreeCAD | 1 | 应用、MCP 客户端和 Addon 已安装 |

## CLI 清单

| 类别 | 数量 | 命令 |
| --- | ---: | --- |
| Shell、源码和终端 | 21 | `rg`、`git`、`gh`、`git-filter-repo`、`jq`、`bat`、`lazygit`、`brew`、`curl`、`rsync`、`ssh`、`openssl`、`zip`、`unzip`、`starship`、`tmux`、`yazi`、`zoxide`、`eza`、`btop`、`htop` |
| 运行时和包管理 | 26 | `mise`、`uv`、`uvx`、`pipx`、`python3`、`pip3`、`node`、`npm`、`npx`、`pnpm`、`yarn`、`go`、`rustc`、`cargo`、`java`、`javac`、`mvn`、`kotlin`、`lua`、`ruby`、`bundle`、`gem`、`dotnet`、`dart`、`flutter`、`spring` |
| 构建、桌面和移动端 | 15 | `make`、`cmake`、`ninja`、`xcodebuild`、`swift`、`clang`、`clang++`、`lldb`、`pod`、`adb`、`scrcpy`、`apktool`、`jadx`、`create-dmg`、`cookiecutter` |
| 服务、容器和数据 | 11 | `docker`、`kubectl`、`cloudflared`、`ollama`、`sqlite3`、`psql`、`redis-cli`、`mysql`、`mongosh`、`atlas`、`duckdb` |
| 文档、图像和媒体 | 16 | `ffmpeg`、`pandoc`、`soffice`、`officecli`、`magick`、`convert`、`qpdf`、`pdftotext`、`pdftoppm`、`tesseract`、`whisper-cli`、`d2`、`glow`、`ncmdump`、`peekaboo`、`himalaya` |
| Agent 和网页自动化 | 6 | `codex`、`claude`、`firecrawl`、`playwright-cli`、`playwright`、`rtk` |

## Codex MCP

| 名称 | 入口 | 状态和用途 |
| --- | --- | --- |
| `apple_shortcuts` | `npx mcp-server-apple-shortcuts` | 已启用；调用 Apple Shortcuts |
| `computer-history` | Codex 插件 | 已启用；读取本机活动记录 |
| `computer-use` | Codex Computer Use 客户端 | 已停用 |
| `context7` | `npx @upstash/context7-mcp` | 已启用；查询库和框架文档 |
| `cua_repl` | Codex 内置 Node.js 运行时 | 已启用；浏览器和本机界面自动化 |
| `figma_ai_bridge` | `npx figma-developer-mcp` | 已启用；读取 Figma 开发信息 |
| `freecad` | `uvx freecad-mcp` | 已启用；连接 FreeCAD Addon 的本地 RPC 服务 |
| `lark_mcp` | `npx @larksuiteoapi/lark-mcp` | 已启用；访问 Lark 能力 |
| `node_repl` | Codex 内置 Node.js REPL | 已启用；执行受信任的本机 JavaScript 工具调用 |

MCP 显示为“已启用”只说明配置会被 Codex 加载。真正调用前还要确认相应应用、网络、账号和后台服务已经就绪。

## FreeCAD MCP

- FreeCAD 位于 `/Applications/FreeCAD-1.0.2.app`，Bundle 版本为 `1.0.2-39319`。
- `freecad-mcp` 版本为 `0.1.22`，由 `/opt/homebrew/bin/uvx` 启动。
- Addon 位于 `~/Library/Application Support/FreeCAD/Mod/FreeCADMCP`。
- RPC 自动启动已开启，远程连接已关闭，允许地址为 `127.0.0.1`。
- MCP 使用前需要先启动 FreeCAD，并确认本地 `9875` 端口正在监听。

## 当前运行条件

- `codex` 的 `PATH` 版本是 `0.139.0`，无法读取当前配置中的 `features.context_management`；Codex 桌面版内置的 `0.153.4` 可以正常读取同一配置。
- Firecrawl CLI 版本是 `1.23.3`，本机已有认证信息；当前账户额度请求返回 HTTP 402。
- Docker CLI 版本是 `29.2.0`，并带有 `docker mcp`；核验时 Docker daemon 没有运行。
- FreeCAD 核验时没有运行，因此本地 RPC 端口没有监听。

项目自己的运行时、包管理、构建、测试和格式规则优先。每次调用会改写文件、外部系统或账号数据的工具前，都要重新确认作用域和当前状态。
