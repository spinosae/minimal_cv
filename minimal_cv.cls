\ProvidesClass{minimal_cv}[2016/01/05 my custom cv class]
%
\NeedsTeXFormat{LaTeX2e}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions \relax
\LoadClass{article}
%
%
\RequirePackage[a4paper,left=1.5cm,right=2.5cm,top=1.5cm,bottom=2cm]{geometry}
\RequirePackage{graphicx}
\RequirePackage{color}
\RequirePackage{array}
\RequirePackage{calc}
\RequirePackage[inline]{enumitem}
\RequirePackage{environ}
\RequirePackage[bookmarks=true]{hyperref}
\RequirePackage{xparse}
\RequirePackage{graphbox}
%\RequirePackage[none]{hyphenat}
%
\newlength{\cola}
\newlength{\colb}
%
\setlength{\cola}{0.2\textwidth}
\setlength{\colb}{\textwidth - \cola - 2em}
%
\def\@undef{\color{red} undefined}
\def\@name{\@undef}
\def\@phone{\@undef}
\def\@email{\@undef}
\def\@website{\@undef}
\def\@address{\@undef}
\def\@logo{}
%
\NewDocumentCommand{\name}{m}{\def\@name{#1}}
\NewDocumentCommand{\phone}{m}{\def\@phone{#1}}
\NewDocumentCommand{\email}{m}{\def\@email{#1}}
\NewDocumentCommand{\website}{m}{\def\@website{#1}}
\NewDocumentCommand{\address}{m}{\def\@address{#1}}
\NewDocumentCommand{\logo}{m}{\def\@logo{#1}}
%
%
\NewDocumentCommand{\getlogo}{O{12mm}}{%
	\ifx\@logo\empty
	\relax
	\else
	\includegraphics[align=c,width=#1]{\@logo}
	\fi
}
%
%

\NewDocumentCommand{\infolist}{}{%
	\ttfamily
	\textsc{\Large\@name}
	\par
	\begin{itemize*}[itemjoin=\hspace{2ex},label=\rule{4pt}{4pt},leftmargin=*]
		\item \mbox{\@phone}
		\item \mbox{\@email}
		\item \mbox{\@website}
		\item \mbox{\@address}
	\end{itemize*}
}
%
%
\newlength{\currentparskip}
\newcolumntype{R}[1]{>{\raggedleft}p{#1}}
\newcolumntype{L}[1]{>{\raggedright\parskip=\currentparskip}p{#1}}
\NewDocumentCommand{\showinfo}{O{3em}}{%
	\cvitem{\getlogo}{\parbox{\colb}{\infolist}}
	\vspace{#1}
}
%
%
\NewDocumentCommand{\starsep}{m}{
	\ifx#1\BooleanFalse 
	\vline height +8pt width 1pt 
	\else 
	\relax 
	\fi
}
%
%
\NewDocumentCommand{\cvitem}{sm+m}{%
	\setlength{\currentparskip}{\parskip}
	\begin{tabular}{R{\cola}!{\starsep{#1}}L{\colb}}%
		#2 & #3
	\end{tabular}
}
%
%
\NewDocumentCommand{\marker}{}{\rule{3mm}{3mm}}
\RenewDocumentCommand{\section}{sm}{%
	\par
	\addcontentsline{toc}{section}{#2}
	\cvitem*{\sffamily\bfseries\MakeUppercase{#2}}{\marker}%
	\par
	%\vspace{0.3em} %
}
%
%
\NewDocumentCommand{\cventry}{mmm+mO{0ex}}{%
	\par
	\cvitem{\small\sffamily#1}{\textsf{\textbf{#2\comma{#3}}#3}\vspace{#5}\par#4}
	\vspace{1em}
	\par
}
%
%
\NewDocumentCommand{\comma}{m}{%
	\if\relax\detokenize{#1}\relax
	\relax
	\else
	,
	\fi
}
%
%
\NewEnviron{hentrylist}{%
	\parbox{\colb}{\begin{itemize*}[itemjoin=\hspace{2ex}]\BODY\end{itemize*}}
}
%
%
\NewEnviron{entrylist}{%
	\parbox{\colb}{\begin{itemize}[leftmargin=*,itemsep=-2pt,topsep=0pt,]\BODY\end{itemize}}
}
%
%
\newcommand{\desclabel}[1]{\textsf{\textbf{#1:}}}



