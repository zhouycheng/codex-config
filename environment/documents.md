# 文档与媒体能力

本机已经具备常用的文档转换、页面检查、OCR、图像和音视频处理入口。正式交付仍需按项目要求检查内容和实际页面效果。

## 当前入口

- `soffice`、`officecli`：Office 文档转换和自动化。
- `pandoc`：Markdown、HTML 和其他受支持文本格式之间的转换。
- `qpdf`、`pdftotext`、`pdftoppm`：PDF 结构检查、文本提取和页面渲染。
- `tesseract`：扫描页和图片 OCR。
- `magick`、`convert`：图像转换、尺寸和格式处理。
- `ffmpeg`、`whisper-cli`：音视频转换、检查和本地语音转写。
- `d2`：从文本生成图表。
- `glow`：在终端预览 Markdown。
- `~/.agents/skills/docling/SKILL.md`：理解 PDF、DOCX 和其他支持的文档内容。
- `~/.agents/skills/pptx/SKILL.md`：处理 PPTX 或 POTX。

先读取与任务匹配的 Skill 和项目规则，再选择具体入口。工具可执行不代表每种输入格式都能无损处理；涉及版式的文件需要渲染后复核。
