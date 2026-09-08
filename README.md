<p align="center"><strong>codex-config 用 Git 管理 Codex 全局规则、本机工具索引和接入脚本</strong></p>

<p align="center">
  <a href="#安装">安装</a> ·
  <a href="environment/INDEX.md">工具清单</a> ·
  <a href="#日常同步">日常同步</a>
</p>

## 核心内容

- `AGENTS.md` 保存跨项目通用的工程判断、证据边界和协作约定。
- `environment/` 记录本机已经核验的 CLI、MCP、应用和文档处理入口。
- `bootstrap/install.sh` 把 Codex 的标准读取路径接到这个仓库。
- 工具索引按任务查阅，项目自己的规则、Skill、Hook 和 CI 仍然优先。

## 安装

```sh
git clone https://github.com/zhouycheng/codex-config.git ~/.codex-config
~/.codex-config/bootstrap/install.sh
```

脚本会建立两个符号链接：

```text
~/.codex/AGENTS.md       → ~/.codex-config/AGENTS.md
~/.codex/environment     → ~/.codex-config/environment
```

目标位置已有文件时，脚本先创建并校验备份；其他已有路径会改名保留。重复执行不会重建正确的链接。修改全局规则后，重启 Codex 或新建任务，让新的指令链生效。

## 工具索引

2026 年 9 月 8 日的本机核验记录包含 95 个 CLI 命令和 9 个 Codex MCP 配置，其中 8 个 MCP 已启用。完整清单、入口和当前运行条件见：

- [开发、CLI、MCP 和应用](environment/development.md)
- [文档、PDF、表格和交付文件](environment/documents.md)
- [公开资料和研究](environment/research.md)

工具出现在清单中，只表示本机已经找到对应入口。涉及账号、额度、后台服务、GUI 或项目依赖时，使用前仍需按说明检查。

## 本机差异

需要记录不适合提交的设备路径或私有服务时，将模板复制为本机覆盖文件：

```sh
cp ~/.codex-config/environment/local.example.md ~/.codex/environment/local.md
```

`local.md` 已加入 Git 忽略规则。不要在仓库中保存 token、密码、Cookie、私钥或其他凭证。

## 日常同步

```sh
cd ~/.codex-config
git pull --ff-only
```

修改共享配置后，先检查差异和链接，再按需要提交：

```sh
git diff --check
~/.codex-config/bootstrap/install.sh
git status --short
```

仓库只跟踪规则、索引和接入脚本。Codex 的认证、会话、缓存、数据库和运行状态由各台电脑本地管理。
