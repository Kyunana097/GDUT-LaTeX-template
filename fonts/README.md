# 字体文件（可选）

如需在 Overleaf 上使用 Windows 原版字体（宋体/黑体/楷体/Times New Roman），上传本目录到 Overleaf 项目根目录，然后将 `gdut-thesis.cls` 中字体部分替换为：

```latex
% ==================== 5. 字体 ====================
% 中文字体
\setCJKmainfont{SimSun}[
    Path        = fonts/,
    Extension   = .ttc,
    BoldFont    = simhei.ttf,
    ItalicFont  = simkai.ttf,
]
\setCJKsansfont{SimHei}[Path=fonts/, Extension=.ttf]
\setCJKmonofont{FangSong}[Path=fonts/, Extension=.ttf]
\setCJKfamilyfont{zhkai}{KaiTi}[Path=fonts/, Extension=.ttf]

% 西文字体
\setmainfont{TimesNewRoman}[
    Path        = fonts/,
    Extension   = .ttf,
    UprightFont = times,
    BoldFont    = timesbd,
    ItalicFont  = timesi,
    BoldItalicFont = timesbi,
]
\setmonofont{CourierNew}[
    Path        = fonts/,
    Extension   = .ttf,
    UprightFont = cour,
    BoldFont    = courbd,
    ItalicFont  = couri,
    BoldItalicFont = courbi,
]
```

**注意**：编译前需在 Overleaf 的 LoadClass 行把 `fontset=fandol` 改为 `fontset=none`。
