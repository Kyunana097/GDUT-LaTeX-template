# 广东工业大学 LaTeX 论文模板

[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

基于 `ctexbook` 的广工课程论文/报告 LaTeX 模板，符合学校格式规范。支持 XeLaTeX 编译，开箱即用。

## 快速开始

### 1. 环境要求

- TeX Live 2024+ 或 MiKTeX
- 推荐使用 VS Code + LaTeX Workshop 插件

### 2. 开始写作

```bash
# 克隆仓库
git clone https://github.com/yourname/gdut-latex-template.git
cd gdut-latex-template

# 复制空白模板开始写作
cp template.tex mypaper.tex

# 编辑封面信息
code mypaper.tex

# 编译
bash build.sh       # macOS / Linux / Git Bash
build.bat           # Windows（双击运行）
```

或者直接用 `template.tex` 改个文件名开始写。

### 3. 编译

```
xelatex mypaper.tex     # 第一次
xelatex mypaper.tex     # 第二次（解决交叉引用）
```

或使用提供的编译脚本：

| 脚本 | 平台 | 用法 |
|------|------|------|
| `build.sh` | macOS / Linux / Git Bash | `bash build.sh` |
| `build.bat` | Windows | 双击运行 |

## 文件说明

| 文件 | 说明 |
|------|------|
| `template.tex` | **空白模板** —— 开箱即用，只有占位符 |
| `example.tex` | **示例论文** —— 刘大柱的智能猪脚饭机 |
| `gdut-thesis.cls` | 核心模板类（格式定义） |
| `figures/GDUT_logo1.png` | 校徽 |
| `figures/GDUT_logo2.jpg` | 文字 logo |

## 封面信息填写

```latex
\coursename{课程设计（论文）}
\thesistitle{论文题目}
\thesistitleen{English Title}      % 可不填
\college{学院名称}
\major{专业名称}
\class{班级}
\studentid{学号}
\studentname{姓名}
\advisor{指导教师}
\thesisdate{2026年6月}
```

## 格式规范

| 项目 | 设置 |
|------|------|
| 纸张 | A4，上 30mm / 下 25mm / 左 30mm / 右 20mm |
| 正文 | 宋体小四 + Times New Roman，1.25 倍行距 |
| 标题 | 黑体，一级三号 / 二级四号 / 三级小四 |
| 参考文献 | GB/T 7714-87 格式 |
| 表格 | 三线表 |
| 页码 | 正文起编，阿拉伯数字，页脚右侧 |

## 参考文献引用

```latex
% 上标引用（默认）
智能制造成熟度模型已得到广泛研究\upcite{ref1}。

% 文中直接引用
由文献\cite{ref1, ref2}可知
```

## 常用命令

| 命令 | 效果 |
|------|------|
| `\upcite{ref1}` | 上标引用 $[1]$ |
| `\cite{ref1}` | 正文引用 |
| `\figref{fig:xxx}` | 图 x-y |
| `\tabref{tab:xxx}` | 表 x-y |
| `\equref{eq:xxx}` | 式 (x.y) |

## 环境

| 环境 | 说明 |
|------|------|
| `zhabstract` | 中文摘要 |
| `enabstract` | 英文摘要 |
| `acknowledgments` | 致谢 |
| `\appendices` | 附录区域 |

## 目录结构

```
.
├── template.tex          ← 空白模板（从这里开始）
├── example.tex           ← 示例论文
├── gdut-thesis.cls       ← 模板类
├── build.sh              ← 编译脚本
├── build.bat             ← 编译脚本（Windows）
├── README.md
└── figures/
    ├── GDUT_logo1.png    ← 校徽
    └── GDUT_logo2.jpg    ← 文字logo
```

## 示例预览

`example.tex` 是刘大柱同学的课程论文《基于嵌入式的智能猪脚饭机控制系统设计与实现》，包含完整的封面、摘要、目录、六章正文、参考文献和致谢。可以编译后查看效果。

## License

MIT
