\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{mynotes}
		[2016/12/21 v1.0
notes class for math]

\DeclareOption{12pt}{
  \PassOptionsToClass{\CurrentOption}{book}
}
\DeclareOption{neverindent}{
  \PassOptionsToPackage{\CurrentOption}{paxcommands}
}
\DeclareOption*{
  \ClassWarning{mynotes}{Unknown option '\CurrentOption'}
}
\ExecuteOptions{11pt}
\ProcessOptions\relax
% Load base
\LoadClass[fleqn]{book}
\RequirePackage[top=3cm,bottom=3cm,left=3cm,right=3cm,a4paper]{geometry}
\RequirePackage{graphicx}
\RequirePackage{tikz}
\RequirePackage{enumitem}
\setlist{nolistsep}
\RequirePackage{booktabs}

% define main color
\RequirePackage{xcolor}
\definecolor{mygreen}{RGB}{100,200,50}
\definecolor{myimportantcolor}{RGB}{240,160,30}

\RequirePackage{microtype}
\RequirePackage{makeidx}
\makeindex

\RequirePackage{titletoc}
% Chapter styling
\titlecontents{chapter}[1.5cm]
{\addvspace{15pt}\large\sffamily\bfseries}
{\color{mygreen!60}\contentslabel[\Large\thecontentslabel]{1.25cm}\color{mygreen}}
{\color{mygreen}}  
{\color{mygreen!60}\normalsize\;\titlerule*[.5pc]{.}\;\thecontentspage}
% Section styling
\titlecontents{section}[1.5cm]
{\addvspace{5pt}\sffamily\bfseries}
{\contentslabel[\thecontentslabel]{1.5cm}}
{}
{\hfill\color{mygreen!80}\thecontentspage}
% Subsection styling
\titlecontents{subsection}[1.5cm]
{\addvspace{1pt}\sffamily\small}
{\contentslabel[\thecontentslabel]{1.25cm}}
{}
{\ \titlerule*[.5pc]{.}\;\thecontentspage}

% Header
\RequirePackage{fancyhdr}

\pagestyle{fancy}
\renewcommand{\chaptermark}[1]{\markboth{\sffamily\normalsize\bfseries\chaptername\ \thechapter.\ #1}{}}
\renewcommand{\sectionmark}[1]{\markright{\sffamily\normalsize\thesection\hspace{5pt}#1}{}}
\fancyhf{} \fancyhead[LE,RO]{\sffamily\normalsize\thepage}
\fancyhead[LO]{\rightmark}
\fancyhead[RE]{\leftmark}
\renewcommand{\headrulewidth}{0.8pt}
\addtolength{\headheight}{2.5pt}
\renewcommand{\footrulewidth}{0.1pt}

\makeatletter
\renewcommand{\cleardoublepage}{
\clearpage\ifodd\c@page\else
\hbox{}\vspace*{\fill}
\thispagestyle{empty}
\newpage
\fi}

\usepackage{amsmath,amsfonts,amssymb,amsthm}
\renewcommand{\qedsymbol}{$\blacksquare$}% qed

% framed environments

\newtheoremstyle{theorembox} % for theorem
{2pt}% space above
{2pt}% space below
{\normalfont}% body font
{}% indent amount
{\small\bf\sffamily\color{myimportantcolor}}% head font
{\;}% punctuation after head
{0.5em}% space after head
{\small\sffamily\color{myimportantcolor}\thmname{#1}\nobreakspace\thmnumber{\@ifnotempty{#1}{}\@upn{#2}}% head text
\thmnote{\nobreakspace\the\thm@notefont\sffamily\bfseries\color{mygreen}\,\nobreakspace(#3).}} % optional note

\newtheoremstyle{exercisebox} % for exercise
{5pt}
{5pt}
{\normalfont}
{}
{\small\bf\sffamily\color{mygreen}}
{\;}
{0.25em}
{\small\sffamily{\tiny\ensuremath{\blacksquare}}\nobreakspace\thmname{#1}\nobreakspace\thmnumber{\@ifnotempty{#1}{}\@upn{#2}}
\thmnote{\nobreakspace\the\thm@notefont\sffamily\bfseries---\nobreakspace(#3).}}

\newtheoremstyle{definitionbox} % for 
{0pt}
{0pt}
{\normalfont}
{}
{\small\bf\sffamily\color{mygreen}}
{\;}
{0.25em}
{\small\sffamily\thmname{#1}\nobreakspace\thmnumber{\@ifnotempty{#1}{}\@upn{#2}}
\thmnote{\nobreakspace\the\thm@notefont\sffamily\bfseries---\nobreakspace#3.}}

% non-framed environments
\newtheoremstyle{nonframedbox}
{5pt}
{5pt}
{\normalfont}
{}
{\small\bf\sffamily\color{myimportantcolor}}
{\;}
{0.25em}
{\small\sffamily\color{myimportantcolor}\thmname{#1}\nobreakspace\thmnumber{\@ifnotempty{#1}{}\@upn{#2}}
\thmnote{\nobreakspace\the\thm@notefont\sffamily\bfseries\color{black}---\nobreakspace#3.}}
\renewcommand{\qedsymbol}{$\blacksquare$}

\makeatother

\newcounter{dummy} 
\numberwithin{dummy}{section}
\theoremstyle{theorembox}
\newtheorem{lemma}{Lemma}
\newtheorem{theoremb}[dummy]{Theorem}
\newtheorem{problem}{Problem}[section]
\newtheorem{exerciseb}{Exercise}[section]
\theoremstyle{exercisebox}
\newtheorem{exampleb}{Example}
\theoremstyle{definitionbox}
\newtheorem{definitionb}{Definition}[section]
\newtheorem{corollaryb}[dummy]{Corollary}
\theoremstyle{nonframedbox}
\newtheorem{proposition}[dummy]{Proposition}
\newtheorem{remarkb}{Remark}[section]
\newtheorem{notationb}{Notation}[section]
\RequirePackage[framemethod=default]{mdframed}

% Theorem box
\newmdenv[skipabove=10pt,
skipbelow=8pt,
backgroundcolor=myimportantcolor!10,
linecolor=myimportantcolor,
innerleftmargin=8pt,
innerrightmargin=8pt,
innertopmargin=5pt,
innerbottommargin=5pt,
linewidth=2pt]{theoremBox}

% Exercise box	  
\newmdenv[skipabove=7pt,
skipbelow=7pt,
leftline=false,
rightline=false,
topline=false,
bottomline=false,
linecolor=mygreen,
innerleftmargin=5pt,
innerrightmargin=5pt,
innertopmargin=5pt,
innerbottommargin=5pt,
linewidth=4pt]{exerciseBox}	

% Definition box
\newmdenv[skipabove=7pt,
skipbelow=7pt,
leftline=true,
rightline=false,
topline=false,
bottomline=false,
linecolor=mygreen,
innerleftmargin=6pt,
innerrightmargin=12pt,
innertopmargin=5pt,
innerbottommargin=5pt,
linewidth=4pt]{definitionBox}	

% Remark box
\newmdenv[skipabove=3pt,
skipbelow=3pt,
leftline=true,
rightline=false,
topline=false,
bottomline=false,
linecolor=myimportantcolor,
innerleftmargin=6pt,
innerrightmargin=12pt,
innertopmargin=5pt,
innerbottommargin=5pt,
linewidth=3.5pt]{remarkBox}

% Corollary box
\newmdenv[skipabove=7pt,
skipbelow=7pt,
leftline=true,
rightline=false,
topline=false,
bottomline=false,
linecolor=mygreen,
backgroundcolor=mygreen!10,
innerleftmargin=5pt,
innerrightmargin=5pt,
innertopmargin=5pt,
innerbottommargin=5pt,
linewidth=4pt]{corollaryBox}

\newenvironment{theorem}{\begin{theoremBox}\begin{theoremb}}{\end{theoremb}\end{theoremBox}}
\newenvironment{exercise}{\begin{exerciseBox}\begin{exerciseb}}{\end{exerciseb}\end{exerciseBox}}		  
\newenvironment{definition}{\begin{definitionBox}\begin{definitionb}}{\end{definitionb}\end{definitionBox}}	
\newenvironment{example}{\begin{exampleb}}{\end{exampleb}}		
\newenvironment{corollary}{\begin{corollaryBox}\begin{corollaryb}}{\end{corollaryb}\end{corollaryBox}}	
\newenvironment{remark}{\begin{remarkBox}\begin{remarkb}}{\end{remarkb}\mbox{}\end{remarkBox}}	

\endinput