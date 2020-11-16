\ProvidesClass{minimal_cv/minimal_cv}[2016/01/05 my custom cv class]
%
\NeedsTeXFormat{LaTeX2e}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions \relax
\LoadClass{article}
%
%
\RequirePackage[left=1.5cm,right=1cm,top=1.5cm,bottom=2cm]{geometry}
\RequirePackage{graphicx}
\RequirePackage{color}
\RequirePackage{array}
\RequirePackage{calc}
\RequirePackage[inline]{enumitem}
\RequirePackage{environ}
\RequirePackage[bookmarks=true]{hyperref}
\RequirePackage{xparse}
\RequirePackage{graphbox}
\RequirePackage{titlesec}
%\RequirePackage[none]{hyphenat}
%
\newlength{\cola}
\newlength{\colb}
%
\NewDocumentCommand{\recalculate}{}{%
	\setlength{\cola}{0.25\textwidth}
	\setlength{\colb}{\textwidth - \cola - 4pt}
}
\recalculate
%
\def\@undef{\color{red} undefined}
\def\@name{\@undef}
\def\@phone{\@undef}
\def\@email{\@undef}
\def\@website{\@undef}
\def\@address{\@undef}
\def\@github{\@undef}
\def\@logo{}
\def\@statement{}
%
\NewDocumentCommand{\name}{m}{\def\@name{#1}}
\NewDocumentCommand{\phone}{m}{\def\@phone{#1}}
\NewDocumentCommand{\email}{m}{\def\@email{#1}}
\NewDocumentCommand{\website}{m}{\def\@website{#1}}
\NewDocumentCommand{\address}{m}{\def\@address{#1}}
\NewDocumentCommand{\logo}{m}{\def\@logo{#1}}
\NewDocumentCommand{\github}{m}{\def\@github{#1}}
\NewDocumentCommand{\statement}{m}{\def\@statement{#1}}
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
	\begin{flushleft}
		\sffamily
		\textbf{\large\@name}
		\par
		\begin{itemize*}[itemjoin=\hspace{3ex},label=\rule{4pt}{4pt}]
			\item \mbox{\@phone}
			\item \mbox{\@email}
			\item \mbox{\@github}
			\item \mbox{\@website}
			\item \mbox{\@address}
		\end{itemize*}
	\end{flushleft}
}
%
%
\newlength{\currentparskip}
\newcolumntype{R}[1]{>{\raggedleft}p{#1}}
\newcolumntype{L}[1]{>{\raggedright\parskip=\currentparskip}p{#1}}
\NewDocumentCommand{\showinfo}{sO{3em}}{%
	\par
	\ifx#1\BooleanFalse
		\cvitem*{\getlogo[12mm]}{\parbox{\colb}{\infolist}}
		\par
		\vspace{-1ex}
		\cvitem*{}{\parbox{\colb}{\emph{\@statement}}}
	\else
		\parbox{\colb}{\infolist}
	\fi
	\par
	\vspace{#2}
}
%
%
\NewDocumentCommand{\showinfol}{O{3em}}{%
	\newlength{\logowidth}
	\setlength{\logowidth}{12mm}
	\begin{minipage}{\logowidth}
		\includegraphics[align=c,width=\logowidth]{\@logo}
	\end{minipage}
	\hspace{2ex}
	\begin{minipage}{\linewidth - \logowidth - 2em}
		\infolist
	\end{minipage}
}
%
%
\NewDocumentCommand{\notstarthen}{mm}{
	\ifx#1\BooleanFalse
		#2
	\else
		\relax
	\fi
}
%
%
\NewDocumentCommand{\cvitem}{sm+m}{%
	\setlength{\currentparskip}{\parskip}
	\begin{tabular}{R{\cola}!{\notstarthen{#1}{\vline height +8pt width 1pt }}L{\colb}}%
		#2 & #3
	\end{tabular}
}

%
%
% \NewDocumentCommand{\marker}{}{\rule{3mm}{3mm}}
% \RenewDocumentCommand{\section}{m}{%
% 	\par
% 	\addcontentsline{toc}{section}{#2}
% 	\cvitem*{\sffamily\bfseries\MakeUppercase{#2}}{\marker}%
% 	\par
% 	\vspace{-0.2em} %
% }
\titleformat{\section}{\sffamily\bfseries}{}{0pt}{\MakeUppercase}[\rule{\textwidth}{1pt}]
\RenewDocumentCommand{\subsection}{m o o}{%
	\addcontentsline{toc}{subsection}{#1 #2 #3}
	\textsf{\textbf{#1}, #2 \hfill \small{#3}}
}
\titleformat{\subsubsection}{\sffamily\centering}{}{0pt}{}
% \titleformat{\subsubsection}[wrap]
% {\sffamily}
% {}{0em}{}[\vspace{-1pt}]

% \titlespacing{\subsubsection}{12pc}{1.5ex plus .1ex minus .2ex}{1pc}
%}
%
\NewDocumentCommand{\cventry}{mmm+mO{0ex}}{%
\par
\cvitem{\small\sffamily#1}{\textsf{\textbf{#2\notemptythen{#3}{,}}#3}\notemptythen{#2#3}{\vspace{#5}\par}#4}
\vspace{1ex}
\par
}
%
%
\NewDocumentCommand{\notemptythen}{m+m}{%
	\if\relax\detokenize{#1}\relax
		\relax
	\else
		#2
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
	\parbox{\colb}{\begin{itemize}[leftmargin=*,itemsep=-2pt]\raggedright\BODY\end{itemize}}
}
%
%
\NewEnviron{leftcol}{%
	\noindent
	\begin{minipage}[t]{\colb}
		\raggedright
		\BODY
	\end{minipage}
}
\NewEnviron{rightcol}{%
	\begin{minipage}[t]{\cola}
		\BODY
	\end{minipage}
}
\newcommand{\desclabel}[1]{\emph{#1:}}




