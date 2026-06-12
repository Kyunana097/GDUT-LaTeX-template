% ===========================================================================
% 广东工业大学课程论文/报告 LaTeX 模板 — gdut-thesis.cls
% Guangdong University of Technology Thesis/Report Template
%
% 编译: XeLaTeX（推荐）| 参考文献: GB/T 7714
% 版本: v1.1  日期: 2026/06
% ===========================================================================

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{gdut-thesis}[2026/06/12 GDUT Thesis Template v1.1]

% ==================== 1. 选项处理 ====================
\newif\ifgdut@proposal  \gdut@proposalfalse
\newif\ifgdut@final     \gdut@finaltrue
\newif\ifgdut@blind     \gdut@blindfalse

\DeclareOption{proposal}{\gdut@proposaltrue\gdut@finalfalse}
\DeclareOption{final}{\gdut@finaltrue\gdut@proposalfalse}
\DeclareOption{blind}{\gdut@blindtrue}
\ProcessOptions\relax

% ==================== 2. 基础文档类 ====================
% openany: 避免章节间空白页 | oneside: 统一左右页边距
\LoadClass[zihao=-4,linespread=1.5,a4paper,fontset=windows,heading=true,scheme=chinese,openany,oneside]{ctexbook}

% ==================== 3. 宏包加载 ====================
\RequirePackage{geometry}
\RequirePackage{graphicx}
\RequirePackage{amsmath,amssymb,amsthm}
\RequirePackage{booktabs}
\RequirePackage{longtable, array, multirow}
\RequirePackage{caption, subcaption}
\RequirePackage{float}
\RequirePackage[section]{placeins}
\RequirePackage{hyperref}
\RequirePackage{xcolor}
\RequirePackage{enumitem}
\RequirePackage{fancyhdr}
\RequirePackage{titletoc}
\RequirePackage{appendix}
\RequirePackage{setspace}
\RequirePackage{listings}
\RequirePackage{algorithm, algpseudocode}
\RequirePackage{siunitx}
\RequirePackage{tikz}                % 封面水印/背景

% ==================== 4. 页面布局 ====================
\geometry{
    paper      = a4paper,
    top        = 30mm,
    bottom     = 25mm,
    left       = 30mm,
    right      = 20mm,
    headheight = 5mm,
    headsep    = 5mm,
    footskip   = 10mm,
}

% ==================== 5. 字体 ====================
\setmainfont{Times New Roman}
\setsansfont{Arial}
\setmonofont{Courier New}

% ==================== 6. 行距与段落 ====================
\setstretch{1.5}                      % 默认 1.5 倍行距
\setlength{\parindent}{2em}           % 首行缩进
\setlength{\parskip}{0pt plus 1pt}    % 段落间距

% ==================== 7. 标题格式 ====================
\ctexset{
    chapter = {
        format      = {\centering\heiti\zihao{3}\bfseries},
        nameformat  = {},
        number      = \arabic{chapter},
        aftername   = {\quad},
        titleformat = {},
        beforeskip  = {20pt},
        afterskip   = {15pt},
        fixskip     = true,
    },
    section = {
        format      = {\heiti\zihao{4}\bfseries},
        aftername   = {\quad},
        beforeskip  = {15pt},
        afterskip   = {10pt},
        fixskip     = true,
    },
    subsection = {
        format      = {\heiti\zihao{-4}\bfseries},
        aftername   = {\quad},
        beforeskip  = {10pt},
        afterskip   = {6pt},
        fixskip     = true,
    },
    subsubsection = {
        format      = {\heiti\zihao{-4}},
        aftername   = {\quad},
        beforeskip  = {8pt},
        afterskip   = {4pt},
        fixskip     = true,
    },
}

% ==================== 8. 目录格式 ====================
\setcounter{tocdepth}{2}
\setcounter{secnumdepth}{3}

\renewcommand{\contentsname}{\centering\heiti\zihao{3}目\quad 录}

% 减少目录标题顶部空白
\let\oldtableofcontents\tableofcontents
\renewcommand{\tableofcontents}{%
    \ctexset{chapter/beforeskip={0pt}}
    \oldtableofcontents
    \ctexset{chapter/beforeskip={20pt}}
}

% titletoc 目录样式
\titlecontents{chapter}[0em]
    {\vspace{6pt}\heiti\zihao{-4}}
    {\thecontentslabel\enspace}
    {}
    {\hspace{0.5em}\titlerule*[4pt]{$\cdot$}\contentspage}

\titlecontents{section}[2em]
    {\songti\zihao{-4}}
    {\thecontentslabel\enspace}
    {}
    {\titlerule*[4pt]{$\cdot$}\contentspage}

\titlecontents{subsection}[4em]
    {\songti\zihao{-4}}
    {\thecontentslabel\enspace}
    {}
    {\titlerule*[4pt]{$\cdot$}\contentspage}

% ==================== 9. 页眉页脚 ====================
\pagestyle{fancy}
\fancyhf{}
\fancyhead[C]{}
\fancyfoot[R]{\songti\zihao{-5}\thepage}
\renewcommand{\headrulewidth}{0pt}

\fancypagestyle{plain}{
    \fancyhf{}
    \fancyfoot[R]{\songti\zihao{-5}\thepage}
    \renewcommand{\headrulewidth}{0pt}
}

% ==================== 10. 图表标题 ====================
\captionsetup{
    font           = {small,bf},
    labelfont      = {bf,small},
    textfont       = {small},
    labelsep       = quad,
    justification  = centering,
    singlelinecheck = true,
}
\renewcommand{\figurename}{图}
\renewcommand{\tablename}{表}
\numberwithin{figure}{chapter}
\numberwithin{table}{chapter}
\numberwithin{equation}{chapter}

% ==================== 11. 代码环境 ====================
\lstset{
    basicstyle       = \small\ttfamily,
    numbers          = left,
    numberstyle      = \tiny\color{gray},
    keywordstyle     = \color{blue},
    commentstyle     = \color{gray!60!green},
    stringstyle      = \color{red},
    frame            = single,
    breaklines       = true,
    showstringspaces = false,
    tabsize          = 2,
    captionpos       = t,
    abovecaptionskip = 8pt,
    belowcaptionskip = 8pt,
}

% ==================== 12. 超链接 ====================
\hypersetup{
    colorlinks  = true,
    linkcolor   = black,
    citecolor   = black,
    urlcolor    = blue,
    pdfcreator  = {LaTeX with GDUT Thesis Template},
}

% ==================== 13. 列表 ====================
\setlist{
    nosep,
    leftmargin   = 2em,
    itemindent   = 2em,
    labelsep     = 0.5em,
    labelwidth   = 2.5em,
    labelindent  = 0em,
}

% ==================== 14. 定理环境 ====================
\newtheorem{theorem}{定理}[chapter]
\newtheorem{lemma}[theorem]{引理}
\newtheorem{proposition}[theorem]{命题}
\newtheorem{corollary}[theorem]{推论}
\newtheorem{definition}{定义}[chapter]
\newtheorem{example}{例}[chapter]
\newtheorem{remark}{注}[chapter]

% ==================== 15. 封面 ====================

% --- 15a. 封面变量 ---
\newcommand{\gdut@coursename}{}
\newcommand{\gdut@thesistitle}{}
\newcommand{\gdut@thesistitleen}{}
\newcommand{\gdut@college}{}
\newcommand{\gdut@major}{}
\newcommand{\gdut@class}{}
\newcommand{\gdut@studentid}{}
\newcommand{\gdut@studentname}{}
\newcommand{\gdut@advisor}{}
\newcommand{\gdut@date}{\today}

% --- 15b. 封面用户命令 ---
\newcommand{\coursename}[1]{\renewcommand{\gdut@coursename}{#1}}
\newcommand{\thesistitle}[1]{\renewcommand{\gdut@thesistitle}{#1}}
\newcommand{\thesistitleen}[1]{\renewcommand{\gdut@thesistitleen}{#1}}
\newcommand{\college}[1]{\renewcommand{\gdut@college}{#1}}
\newcommand{\major}[1]{\renewcommand{\gdut@major}{#1}}
\newcommand{\class}[1]{\renewcommand{\gdut@class}{#1}}
\newcommand{\studentid}[1]{\renewcommand{\gdut@studentid}{#1}}
\newcommand{\studentname}[1]{\renewcommand{\gdut@studentname}{#1}}
\newcommand{\advisor}[1]{\renewcommand{\gdut@advisor}{#1}}
\newcommand{\thesisdate}[1]{\renewcommand{\gdut@date}{#1}}

% --- 15c. 封面排版 ---
\newcommand{\makecover}{
    \thispagestyle{empty}

    % ===== 顶部横幅（tikz overlay）=====
    \begin{tikzpicture}[remember picture, overlay]
        % 蓝色渐变背景条
        \shade[left color=cyan!70!blue, right color=blue!70!black]
            (current page.north west) rectangle
            ([yshift=-3.5cm]current page.north east);
        % 校徽（左）
        \node[anchor=north west, inner sep=0pt]
            at ([xshift=1.5cm, yshift=-0.4cm]current page.north west){
            \includegraphics[width=2.2cm]{figures/GDUT_logo1.png}
        };
        % 学校名（右）
        \node[anchor=north east, inner sep=0pt]
            at ([xshift=-1.5cm, yshift=-1.4cm]current page.north east){
            \textcolor{white}{\heiti\zihao{1}广东工业大学}
        };
    \end{tikzpicture}

    % ===== 封面正文 =====
    \begin{center}
        \vspace*{4.5cm}

        % 课程名
        {\heiti\zihao{1} \gdut@coursename}

        \vspace{60pt}

        % 标题
        {\heiti\zihao{2} \gdut@thesistitle}

        \vspace{20pt}
        % 英文标题（可选）
        %{\zihao{4} \gdut@thesistitleen}

        \vspace{70pt}

        % 个人信息表
        \begin{spacing}{2.0}
            \zihao{3}
            \begin{tabular}{r@{：}l}
                \heiti\bfseries\makebox[5em][s]{学\hfill 院} & \heiti\bfseries\underline{\makebox[7cm]{\gdut@college}} \\
                \heiti\bfseries\makebox[5em][s]{专\hfill 业} & \heiti\bfseries\underline{\makebox[7cm]{\gdut@major}} \\
                \heiti\bfseries\makebox[5em][s]{年级班级}     & \heiti\bfseries\underline{\makebox[7cm]{\gdut@class}} \\
                \heiti\bfseries\makebox[5em][s]{学\hfill 号} & \heiti\bfseries\underline{\makebox[7cm]{\gdut@studentid}} \\
                \heiti\bfseries\makebox[5em][s]{学生姓名}     & \heiti\bfseries\underline{\makebox[7cm]{\gdut@studentname}} \\
                \heiti\bfseries\makebox[5em][s]{指导教师}     & \heiti\bfseries\underline{\makebox[7cm]{\gdut@advisor}} \\
            \end{tabular}
        \end{spacing}

        \vspace{50pt}

        % 日期
        {\songti\zihao{4} \gdut@date}
    \end{center}
    \newpage
}

% ==================== 16. 摘要 ====================

% --- 16a. 关键词存储 ---
\newcommand{\gdut@zhkeywords}{}
\newcommand{\gdut@enkeywords}{}
\newcommand{\zhkeywords}[1]{\renewcommand{\gdut@zhkeywords}{#1}}
\newcommand{\enkeywords}[1]{\renewcommand{\gdut@enkeywords}{#1}}

% --- 16b. 中文摘要 ---
\newenvironment{zhabstract}{
    \chapter*{\centering\heiti 摘\quad 要}
    \vspace{10pt}
    \setlength{\parindent}{2em}
    \setstretch{1.5}
    \songti\zihao{-4}
}{
    \vspace{15pt}
    \par\vspace{6pt}
    \noindent{\heiti\zihao{-4} 关键词：}
    \songti\zihao{-4}\gdut@zhkeywords
    \newpage
}

% --- 16c. 英文摘要 ---
\newenvironment{enabstract}{
    \chapter*{\centering\bfseries\zihao{3} Abstract}
    \vspace{10pt}
    \setlength{\parindent}{2em}
    \setstretch{1.5}
    \zihao{-4}
}{
    \vspace{15pt}
    \par\vspace{6pt}
    \noindent{\bfseries\zihao{-4} Key words: }
    \zihao{-4}\gdut@enkeywords
    \newpage
}

% ==================== 17. 致谢 ====================
\newenvironment{acknowledgments}{
    \chapter*{\centering\heiti 致\quad 谢}
    \songti\zihao{-4}
    \setlength{\parindent}{2em}
}{\newpage}

% ==================== 18. 附录 ====================
\renewcommand{\appendices}{
    \appendix
    \renewcommand{\thechapter}{\Alph{chapter}}
    \ctexset{
        chapter = {
            name        = {附录},
            number      = \Alph{chapter},
            format      = {\centering\heiti\zihao{3}\bfseries},
        },
    }
}

% ==================== 19. 参考文献 ====================
\PassOptionsToPackage{backend=biber,style=gbt7714-numeric,gbtype=false}{biblatex}

% ==================== 20. 自定义命令 ====================

% 三线表
\newcommand{\tablethree}[1]{%
    \begin{tabular}{#1}
        \toprule
}
\newcommand{\tableend}{%
        \bottomrule
    \end{tabular}
}

% 交叉引用快捷命令
\newcommand{\figref}[1]{图~\ref{#1}}
\newcommand{\tabref}[1]{表~\ref{#1}}
\newcommand{\equref}[1]{式~(\ref{#1})}
\newcommand{\secref}[1]{\ref{#1}~节}

% 参考文献上标引用（Times New Roman 小五号上标）
\newcommand{\upcite}[1]{\textsuperscript{\rmfamily\mdseries\zihao{-5}\cite{#1}}}

% 数值单位
\newcommand{\unitx}[1]{\,\mathrm{#1}}

% ==================== 21. 文档初始化 ====================
% 公式间距
\AtBeginDocument{
    \abovedisplayskip  = 8pt plus 3pt minus 4pt
    \abovedisplayshortskip = 4pt plus 2pt minus 2pt
    \belowdisplayskip  = 8pt plus 3pt minus 4pt
    \belowdisplayshortskip = 4pt plus 2pt minus 2pt

    % 封面、摘要、目录不编页码
    \pagenumbering{gobble}
}

% 正文开始（目录之后调用，页码从1开始）
\newcommand{\mainbody}{
    \newpage
    \pagenumbering{arabic}
    \setcounter{page}{1}
    \pagestyle{fancy}
    \setstretch{1.25}   % 正文 1.25 倍行距
}

% ==================== 结束 ====================
\endinput
