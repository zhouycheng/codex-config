# codex-config

个人 Codex 用户级配置，用 Git 在多台电脑之间保持一致。

仓库维护全局 `AGENTS.md` 和本机能力索引。安装脚本把 Codex 的标准读取路径链接到这里，修改仓库文件后，Codex 使用的内容会随之更新。

## 目录

- `AGENTS.md`：跨项目通用的工程判断、证据边界、执行原则和协作约定。
- `environment/`：按任务查阅的本机能力索引。详细流程继续放在项目规则和 Skill 中。
- `bootstrap/install.sh`：在一台新电脑上接入标准读取路径。

## 首次安装

```sh
git clone https://github.com/zhouycheng/codex-config.git ~/src/codex-config
~/src/codex-config/bootstrap/install.sh
```

安装脚本会建立以下链接：

```text
~/.codex/AGENTS.md       → ~/src/codex-config/AGENTS.md
~/.codex/environment     → ~/src/codex-config/environment
```

如果目标位置已有实体文件，脚本会先创建带时间戳的备份并逐字节校验，确认备份成功后再删除原文件并创建链接。已有其他路径会先改名备份。重复运行脚本不会重复创建正确的链接。

修改全局规则后重启 Codex，使新的指令链在新任务中生效。

## 本机差异

需要记录设备专属路径、应用或服务时，将模板复制为本机覆盖文件：

```sh
cp ~/src/codex-config/environment/local.example.md ~/.codex/environment/local.md
```

`local.md` 已加入 Git 忽略规则。填写时不要保存 token、密码、Cookie、私钥或其他凭证。

## 日常同步

```sh
cd ~/src/codex-config
git pull --ff-only
```

编辑 `AGENTS.md` 或 `environment/` 中的共享内容后，检查 diff，再按需要提交并推送：

```sh
git add AGENTS.md environment
git commit -m "docs(config): 更新 Codex 用户配置"
git push
```

仓库只跟踪配置和索引文件。Codex 的认证、会话、缓存、数据库和运行状态继续由各台电脑本地管理。
