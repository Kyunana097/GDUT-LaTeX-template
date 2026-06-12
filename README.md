# 广东工业大学 LaTeX 论文模板

[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

基于 `ctexbook` 的广工课程论文/报告 LaTeX 模板，封面采用 tikz 校标横幅设计，符合学校格式规范。XeLaTeX 编译。

```bash
git clone https://github.com/Kyunana097/GDUT-LaTeX-template.git
```

## 快速开始

### 本地编译

```bash
cp template.tex mypaper.tex   # 复制空白模板
# 编辑封面信息
bash build.sh                  # 编译（Windows 双击 build.bat）
```

### Overleaf

上传 `gdut-latex-overleaf.zip` → Menu → Compiler 选 **XeLaTeX** → Recompile。

如需 Windows 原版字体（宋体/黑体/Times New Roman），上传 `fonts/` 文件夹后按 `fonts/README.md` 修改 cls。

## 文件说明

| 文件 | 说明 |
|------|------|
| `template.tex` | 空白模板，只有占位符，开箱即用 |
| `example.tex` | 示例论文——刘大柱《基于STM32的智能猪脚饭机控制系统设计与实现》 |
| `gdut-thesis.cls` | 核心模板类（封面/格式/引用等全部定义） |
| `build.sh` / `build.bat` | 编译脚本 |
| `figures/` | 校徽 `GDUT_logo1.png` + 文字logo `GDUT_logo2.jpg` |
| `fonts/` | Windows 原版字体（可选，给 Overleaf 用） |

## 封面信息

```latex
\coursename{课程设计（论文）}
\thesistitle{论文题目}
\thesistitleen{English Title}
\college{学院名称}
\major{专业名称}
\class{班级}
\studentid{学号}
\studentname{姓名}
\advisor{指导教师}
\thesisdate{2026年6月}
```

## 格式规范

| 项目 | 说明 |
|------|------|
| 纸张 | A4，上30 / 下25 / 左30 / 右20 mm |
| 正文 | 宋体小四 + Times New Roman，1.25倍行距 |
| 标题 | 黑体：一级三号 / 二级四号 / 三级小四 |
| 封面 | tikz 蓝色渐变横幅 + 校徽 + 校名 |
| 参考文献 | GB/T 7714-87 格式 |
| 表格 | 三线表 |
| 页码 | 正文起编，阿拉伯数字，页脚右侧 |

## 参考文献

```latex
% 上标引用
智能制造成熟度模型已得到广泛研究\upcite{ref1}。

% 文中直接引用
由文献\cite{ref1, ref2}可知
```

## 命令速查

| 命令 | 效果 | 命令 | 效果 |
|------|------|------|------|
| `\upcite{ref1}` | 上标 [1] | `\figref{fig:1}` | 图 x-y |
| `\cite{ref1}` | 正文引用 | `\tabref{tab:1}` | 表 x-y |
| `\zhabstract` | 中文摘要 | `\equref{eq:1}` | 式 (x.y) |
| `\enabstract` | 英文摘要 | `\acknowledgments` | 致谢 |
| `\mainbody` | 正文开始 | `\appendices` | 附录 |

## 示例预览

`example.tex` 编译后包含：封面（含校标横幅）→ 中英文摘要 → 目录 → 六章正文 → 参考文献 → 致谢。内容是刘大柱同学的嵌入式智能猪脚饭机设计。
