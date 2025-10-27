\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{mc}[2014/08/16 Example LaTeX class]
\newcommand{\headlinecolor}{\normalcolor}
\LoadClass{book}

% TIKZ STUFF
\RequirePackage{tikz}
\usetikzlibrary{decorations.pathmorphing,patterns}
\usetikzlibrary{arrows}
\DeclareMathSymbol{;}{\mathpunct}{operators}{"3B}
\tikzstyle{axis}=[>=latex,thick]

\RequirePackage{xcolor}
\RequirePackage{geometry}
\RequirePackage{fontawesome} % For icons
\RequirePackage{hyperref}
\RequirePackage{linebreaker}
\RequirePackage{mathtools}
 
\RequirePackage{calc}
\RequirePackage{ifthen}


\RequirePackage{tabularx}
\RequirePackage{float}
\RequirePackage{bm}
\RequirePackage[most]{tcolorbox}


\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
 
\geometry{paper=a4paper,portrait}


\definecolor{auburn}{rgb}{0.43, 0.21, 0.1}
\hypersetup{colorlinks = true,anchorcolor=blue,linkcolor=auburn}
\newtagform{auburn}{\color{auburn}(}{)}
\usetagform{auburn}
\setlength{\mathindent}{0cm}



\definecolor{turquoiseblue}{rgb}{0.0, 1.0, 0.94}
\definecolor{uclbleunuit}{rgb}{0, 0.1289, 0.3047}
\definecolor{uclcyan}{rgb}{0.3633, 0.6992 , 0.8984}
\definecolor{uclbleugris}{rgb}{0.6094,.7148,0.8281}

\newlength\bl
\setlength\bl\baselineskip
\renewcommand{\normalsize}{\fontsize{14}{16}\selectfont}
\newcommand{\topbox}[1]{\raisebox{.5\bl-\height}{#1}}
\newcommand{\ftopbox}[1]{\framebox{\topbox{{#1}}}}
\setcounter{secnumdepth}{3}
\def\minus{%
  \setbox0=\hbox{-}%
  \vcenter{%
    \hrule width\wd0 height \the\fontdimen8\textfont3%
  }%
}

\newcommand\rbox[1]{{%
\setlength\parfillskip{0pt}%
\hrulefill
\makebox[0pt]{#1}%
\hrulefill
\par
\bigskip}}
\setlength\parindent{0pt}
%\newenvironment{sideimage}[1]{
%\begin{tabularx}{\textwidth}{@{}lX@{}|}
%  \topbox{#1}  &}{\end{minipage}\end{tabularx}}

%\DeclareMathOperator{\D}{D}
%\DeclareMathOperator{\dif}{d}
\newcommand{\Dif}{\mathop{}\!\mathrm{D}}
\newcommand{\dif}{\mathop{}\!\mathrm{d}}

\newcommand{\od}[3][]{
\ifthenelse{\equal{#1}{}}{
\frac{\dif #2}{\dif #3}}{
\frac{\dif^{#1} #2}{\dif #3^{#1}}}
}


\newcommand{\pd}[3][]{
\ifthenelse{\equal{#1}{}}{
\frac{\partial #2}{\partial #3}}
{\frac{\partial^{#1} #2}{\partial #3^{#1}}
}}

\newcommand{\eqdef}{\stackrel{\rm def}{=}}
\renewcommand\vec[1]{\boldsymbol{#1}}

\makeatletter
\newcommand\mathsquared[2][black]{%
  \tikzstyle{mathbox}=[#1]
  \mathpalette\@mathsquared{#2}%
}
\newcommand\@mathsquared[2]{%
  \tikz[baseline=(math.base)] \node[draw,mathbox,inner sep=5pt] (math) {$\m@th#1#2$};%
}
\makeatother

\newcommand{\uclouvainlogo}[3]{
\begin{scope}[shift={(#1,#2)}, scale=#3]
    \fill[fill=uclcyan] (0,0) rectangle (0.75,0.25);
    \fill[fill=uclcyan] (0,0) rectangle (0.25,1.00);
    \fill[fill=uclbleunuit] (0.25,0.25) rectangle (0.75,1.00);
    \fill[fill=uclbleugris] (0.75,0.25) rectangle (1.00,1.00);
  \end{scope}
}


\makeatletter

\newcommand{\@coursecode}{coursecode}
\renewcommand{\@title}{title}
\newcommand{\@academicyear}{academicyear}
\newcommand{\@documenttype}{documenttype}
\newcommand{\@coursetitle}{coursetitle}
\newcommand{\@school}{UCLouvain -- Facult\'e des Sciences}
\newcommand{\coursecode}[1]{\renewcommand{\@coursecode}{#1}}
\newcommand{\coursetitle}[1]{\renewcommand{\@coursetitle}{#1}}
\newcommand{\documenttype}[1]{\renewcommand{\@documenttype}{#1}}
\newcommand{\academicyear}[1]{\renewcommand{\@academicyear}{#1}}
\newcommand{\school}[1]{\renewcommand{\@school}{#1}}
%%%% MATHEMATICAL DEFINITIONS
\def\cross{\times}
\renewcommand{\vec}[1]{\bm{#1}}
\newcommand{\curl}{\grad\cross}
\newcommand{\lapl}{\nabla^2}
\renewcommand{\u}{\ensuremath{\vec{u}}}
\newcommand{\uh}{\ensuremath{\vec{u}_h}}
\newcommand{\ua}{\ensuremath{\vec{u}_a}}
\newcommand{\steady}[1]{{#1}_{r}}
\newcommand{\cindex}[1]{#1\index{#1}}
\newcommand{\rf}[1]{{{#1}_{r}}}
\newcommand{\ez}{\ensuremath{\vec{e}_z}}
\newcommand{\ey}{\ensuremath{\vec{e}_y}}
\newcommand{\ex}{\ensuremath{\vec{e}_x}}
\newcommand{\advec}{\vec{u}\cdot\nabla}
\newcommand{\advech}{\vec{u}_h\cdot\nabla_h}
\newcommand{\Dt}[1]{\frac{\Dif #1}{\Dif t}}
\newcommand{\Dtg}[1]{\left.\frac{\Dif #1}{\Dif t}\right|_g}
%\newcommand{\pdt}[1]{\pd{#1}{t}}
\newcommand{\pdx}[1]{\pd{#1}{x}}
\newcommand{\pdy}[1]{\pd{#1}{y}}
\newcommand{\pdz}[1]{\pd{#1}{z}}
\newcommand\odd[2]{\frac{\mathop\mathrm{d} {#1}}{{\mathop\mathrm{d}{#2}}}}
\newcommand\pdd[2]{\frac{\partial {#1}}{\partial {#2}}}
\def\vpot{\varphi}
\def\grad{\bm{\nabla}}
\def\gradh{\nabla_h}
\def\Div{\grad\cdot}
\def\anom{\tilde}
\def\ampl{\hat}
\def\Divh{\nabla_h\cdot}
\newcommand{\pdt}[1]{\pd{#1}{t}}
\newcommand{\pdtt}[1]{\pd[2]{#1}{t}}
%------------------

\renewcommand{\titlepage}{%
\begingroup% 
\thispagestyle{empty}
%\hpace{0.4\textwidth}
%\hfill
\hspace{0.4\textwidth}%
\parbox{0.8\textwidth}{%
\begin{flushright}
\textcolor{uclbleunuit}{
{\Huge\scshape\sf \@coursetitle} \\ [\baselineskip]
{\Huge\scshape\sf \@coursecode} \\ [\baselineskip]
}
 \end{flushright}
}\\ [\baselineskip] 
%parbox \\

\hspace{0.4\textwidth}%
\colorbox{uclbleunuit}{%
  \parbox[][12cm][b]{0.8\textwidth}{%
  \setlength{\parskip}{4\bigskipamount plus \smallskipamount minus \smallskipamount}
  \begin{flushright}
  \textcolor{white}{%
{\large\scshape\sf \@documenttype} \\[\baselineskip]
{\large\scshape\sf \@academicyear} \\[\baselineskip]
}
\textcolor{uclcyan}{%
{\large\scshape\sf \@author} \\ [\baselineskip]
{\large\scshape\sf Facult\'e des Sciences}% %\\ [\baselineskip]
}
\end{flushright}
}
}
\vspace{2.0cm}
\\
\begin{tikzpicture}
  \uclouvainlogo{0}{0}{0.6pt}
\end{tikzpicture} {\Huge\sf{UCLouvain}}
\hfill
\endgroup}
\makeatother


% ==========================================================
% Harmonised Box System
% ==========================================================

% Define a base style for all custom boxes
\tcbset{
  myboxstyle/.style={
    enhanced,
    boxrule=1.2pt,
    arc=6pt,
    top=8pt,
    bottom=8pt,
    left=10pt,
    right=10pt,
    attach boxed title to top left={yshift=-3mm, xshift=5mm},
    drop shadow
  },
  myboxtitle/.style={
    enhanced,
    boxrule=0pt,
    rounded corners=southeast,
    top=3pt,
    bottom=3pt,
    left=6pt,
    right=6pt
  }
}

% ==========================================================
% Macro to Define New Box Types
% Usage:
% \newcoursebox{name}{icon}{title prefix}{title color}{box color}
% ==========================================================

\newcommand{\newcoursebox}[6][]{%
  % #1 = optional extra tcolorbox options
  % #2 = environment name
  % #3 = icon
  % #4 = title text prefix (e.g. "(recall):")
  % #5 = title background color
  % #6 = frame / background color
  \newtcolorbox[#1]{#2}[1]{myboxstyle, breakable, enhanced, 
    colback=#6!10!white,
    colframe=#6!75!black,
    colbacktitle=#5,
    coltitle=white,
    fonttitle=\bfseries,
    title={#3 \parbox{0.85\textwidth}{#4\ ##1}},
    boxed title style={myboxtitle, colframe=#5, colback=#5}
  }
}

% ==========================================================
% Define Specific Course Box Types
% ==========================================================

\newcoursebox{studentinvestigation}{\faGraduationCap}{}{blue!75!black}{blue!75!black}
\newcoursebox{synthesis}{\faBinoculars}{Synthesis:}{red!75!black}{blue!75!black}
\newcoursebox{furtherreading}{\faBook}{Further Reading}{blue!80!black}{blue!60!black}
\newcoursebox{key}{\faKey}{Key Outcome:}{orange!75!white}{blue!75!black}
\newcoursebox{basicnotion}{\faHistory}{(recall):}{green!35!white}{green!75!black}


