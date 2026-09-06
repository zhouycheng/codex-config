# codex-config

个人 Codex 用户级配置，作为独立 Git 仓库维护。

仓库只保存跨设备共享的 `AGENTS.md` 和 `environment/` 内容。Codex 运行状态、认证、缓存、会话和本机私有覆盖保留在各自设备上。

## 安装

```sh
git clone <private-repository-url> ~/src/codex-config
~/src/codex-config/bootstrap/install.sh
```

安装脚本会把标准读取路径链接到本仓库；已有文件会先改名备份，不会直接覆盖。

## 本机差异

将 `environment/local.example.md` 复制为 `~/.codex/environment/local.md`，填写设备专属能力。`local.md` 默认不会提交。

## 同步

```sh
cd ~/src/codex-config
git pull --ff-only
```

提交和推送由用户明确执行；本仓库不包含认证信息或 Codex 运行数据。
