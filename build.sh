#!/bin/bash
# ============================================================
# 广东工业大学 LaTeX 论文编译脚本
# 用法: bash build.sh
# ============================================================

# TeX Live 路径
export PATH="/d/texlive/2025/bin/windows:$PATH"

# 文件名（不含扩展名）
TEXFILE="main"

echo ">> 开始编译 ${TEXFILE}.tex ..."
echo ""

# 清理旧文件
rm -f ${TEXFILE}.aux ${TEXFILE}.toc ${TEXFILE}.out ${TEXFILE}.log

# 第一次编译
echo ">> [1/2] 第一次 XeLaTeX 编译..."
xelatex -interaction=nonstopmode ${TEXFILE}.tex > /dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "!! 编译失败，请查看 ${TEXFILE}.log"
    exit 1
fi
echo "    完成。"

# 第二次编译（解决交叉引用）
echo ">> [2/2] 第二次 XeLaTeX 编译..."
xelatex -interaction=nonstopmode ${TEXFILE}.tex > /dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "!! 编译失败，请查看 ${TEXFILE}.log"
    exit 1
fi
echo "    完成。"

# 清理辅助文件
rm -f ${TEXFILE}.aux ${TEXFILE}.toc ${TEXFILE}.out ${TEXFILE}.log

echo ""
echo "=== 编译成功 ==="
echo "输出: ${TEXFILE}.pdf ($(du -sh ${TEXFILE}.pdf 2>/dev/null | cut -f1))"
echo ""
