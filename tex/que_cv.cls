\ProvidesClass{que_cv}[2016/01/05 my custom cv class]
%
\NeedsTeXFormat{LaTeX2e}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions \relax
\LoadClass{article}
%
%
\RequirePackage{titlesec}
\RequirePackage[left=2cm,right=2cm,top=1.5cm,bottom=2cm]{geometry}
\RequirePackage{graphicx}
\RequirePackage{color}
\RequirePackage{multirow}
\RequirePackage{booktabs}
\RequirePackage{array}
\RequirePackage{calc}
\RequirePackage[inline]{enumitem}
\RequirePackage{environ}
\RequirePackage[bookmarks=true]{hyperref}
%\RequirePackage[none]{hyphenat}
%\RequirePackage[document]{ragged2e}
%
\newlength{\cola}
\newlength{\colb}
\newlength{\logow}
\newlength{\secsep}
\newlength{\subsecsep}
%
\setlength{\cola}{0.2\textwidth}
\setlength{\colb}{\textwidth - \cola - 2em}
\setlength{\logow}{12mm}
\setlength{\secsep}{5pt}
\setlength{\subsecsep}{4pt}
%
\def\@undef{\color{red} undefined}
\def\@name{\@undef}
\def\@phone{\@undef}
\def\@email{\@undef}
\def\@website{\@undef}
\def\@address{\@undef}
\def\@logo{\@empty}
%
\newcommand{\setname}[1]{\def\@name{#1}}
\newcommand{\setphone}[1]{\def\@phone{#1}}
\newcommand{\setemail}[1]{\def\@email{#1}}
\newcommand{\setwebsite}[1]{\def\@website{#1}}
\newcommand{\setaddress}[1]{\def\@address{#1}}
\newcommand{\setlogo}[1]{\def\@logo{#1}}
%
\newcommand{\fmtinfo}[1]{\mbox{\texttt{#1}}}
%\newcommand{\getname}{\textsf{\textbf{\Large\MakeUppercase\@name}}}
\newcommand{\getname}{\texttt{\textbf{\Large\@name}}}
\newcommand{\getphone}{\fmtinfo{\@phone}}
\newcommand{\getemail}{\fmtinfo{\@email}}
\newcommand{\getwebsite}{\fmtinfo{\@website}}
\newcommand{\getaddress}{\fmtinfo{\@address}}
\newcommand{\getlogo}{%
  \ifx\@logo\@empty
    \relax
    \else
    \includegraphics[width=\logow]{\@logo}
  \fi %
}
%
%
\newcommand{\infolist}{%
  \begin{itemize*}[itemjoin=\hspace{2ex},label=\rule{4pt}{4pt}]
  \item \getphone
    \item \getemail
    \item \getwebsite
    \item \getaddress
    \end{itemize*}
}
%
\newcommand{\showinfo}{%
  \noindent
    \begin{tabular}{l l}
  %\toprule
    %\parbox{\widthof{\getlogo}}{\getlogo} & %
    %\parbox{\cola}{\getlogo} & %
    %\parbox{\colb}%
%    \parbox{\textwidth-\widthof{\getlogo}-4\tabcolsep}%
%    {\raggedleft\getname\\\infolist} & % \\
%    \parbox{\widthof{\getlogo}}{\getlogo} \\ %
    \parbox{\cola}{\raggedleft\getlogo} & %
    \parbox{\colb}%
    {\raggedright \getname\\\infolist} \\
  %\bottomrule
    \end{tabular}
  \par%
  \vspace{1em}
}
%
%
\titleformat{\section}%
%[block]%
{\normalfont\sffamily\bfseries}%
{}{0em}%
{\raggedleft\MakeUppercase}
%
\titleformat{\subsection}%
[block]%
{\normalfont}%
{}{0em}%
{}
%
%
\titlespacing*{\section}{0pt}{\subsecsep}{0pt}
\titlespacing*{\subsection}{0pt}{\subsecsep}{0pt}
%
%
\NewEnviron{cvsection}[1]{%
  \noindent
    \begin{tabular}{l!{\vline height -\subsecsep width 1pt}l}
  \parbox[t]{\cola}{\section{#1}} & \parbox[t]{\colb}{\vspace{0pt} \BODY}\\
    \end{tabular}
}
%
%
\newcommand{\ifnullstr}[1]{%
  \if\relax\detokenize{#1}\relax
    \relax
    \else
    ,
    \fi
}
\newcommand{\subm}[1]{\textsf{\textbf{#1}}}
\newcommand{\suba}[1]{\textsf{#1}}
\newcommand{\sube}[1]{\textsf{\small\textsl{#1}}}
\newcommand{\cvsubsection}[3]{%
  \subsection[#1]{\subm{#1\ifnullstr{#2}}\suba{#2}\hfill\sube{#3}}%
}
\newcommand{\inlinecvsub}[1]{%
\titleformat{\subsection}[runin]{\normalfont}{}{0em}{}
\subsection[#1]{\subm{#1:\,}}}
%
%
\newenvironment{hentrylist}%
{\begin{itemize*}[itemjoin=\hspace{2ex}]}%
{\end{itemize*}}
\newenvironment{entrylist}%
{\begin{itemize}[itemsep=1pt,topsep=0pt,parsep=0pt,leftmargin=1em,itemindent=0em]}%
{\end{itemize}}
%
\newcommand{\desclabel}[1]{\textsf{\textbf{#1:}}}



