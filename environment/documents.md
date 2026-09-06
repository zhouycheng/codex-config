# 文档能力

记录跨设备可复用的文档处理入口。详细命令和领域验收规则放在对应项目或 Skill 中。

## 当前入口

- `~/.agents/skills/docling/SKILL.md`：需要理解 PDF、DOCX 或其他文档内容时按需读取。
- `~/.agents/skills/pptx/SKILL.md`：涉及 PPTX 或 POTX 时按需读取。
- `~/.agents/skills/pdf/SKILL.md`：涉及 PDF 创建、渲染或页面检查时按需读取（如该 Skill 在当前设备可用）。
- `soffice`：当前设备可调用；用于转换前先运行 `soffice --help` 或项目规定的检查。
- `pandoc`：当前设备可调用；适合支持的文本格式转换，不替代需要保留原始布局的专用流程。

## 使用边界

优先读取与任务匹配的 Skill 和项目规则，再选择入口。正式交付文件需要根据项目要求检查内容和实际页面效果。本文件不记录账号、凭证、机器专属路径或未经当前环境核实的命令。
