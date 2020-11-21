\ProvidesClass{minimal_cv/minimal_cv}[2016/01/05 my custom cv class]
%
\NeedsTeXFormat{LaTeX2e}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions \relax
\LoadClass{article}
%
%
\RequirePackage[left=1.25cm,right=1.25cm,top=1.5cm,bottom=2cm]{geometry}
\RequirePackage{graphicx}
\RequirePackage{xcolor}
\RequirePackage{array}
\RequirePackage{calc}
\RequirePackage[inline]{enumitem}
\RequirePackage{environ}
\RequirePackage[bookmarks=true]{hyperref}
\RequirePackage{xparse}
\RequirePackage{graphbox}
\RequirePackage{titlesec}
\RequirePackage{fontawesome}
\RequirePackage{etoolbox}
\RequirePackage{pgffor}
%\RequirePackage[none]{hyphenat}
%
\colorlet{accent}{blue!70!black}
\colorlet{heading}{black}
\colorlet{emphasis}{black}
\colorlet{body}{black!80!white}
%
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
		\@statement
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
		\cvitem*{\getlogo[12mm]}{\parbox{\coll}{\infolist}}
		\par
		\vspace{-1ex}
		\cvitem*{}{\parbox{\coll}{\emph{\@statement}}}
	\else
		\parbox{\coll}{\infolist}
	\fi
	\par
	\vspace{#2}
}
%
%
\newlength{\colr}
\newlength{\coll}
\NewDocumentCommand{\layout}{m O{5mm}}{%
       \setlength{\coll}{#1}
       \setlength{\colr}{\textwidth - \coll - #2}
}
\layout{0.7\textwidth}
%
%
\NewDocumentEnvironment{leftcol}{O{0.7}}{%
	\noindent
	\begin{minipage}[t]{\coll}
		\raggedright \
}{%
	\end{minipage}%
	\hfill
}
\NewEnviron{rightcol}{%
	\newlength{\availablev}
	\setlength{\availablev}{%
		\the\dimexpr\textheight-0.2in-\pagetotal\relax
	}%
	\begin{minipage}[t]{\colr}
		\ \BODY
	\end{minipage}
}
%
%
\NewDocumentCommand{\showinfol}{O{3em}}{%
	\newlength{\logowidth}
	\setlength{\logowidth}{14mm}
	\noindent
	\begin{minipage}[b][][c]{\coll}
		\includegraphics[align=c,width=\logowidth]{\@logo}
		\hfill
		\begin{minipage}[c]{\linewidth - \logowidth - 2ex}
			% \raggedright
			\sffamily
			\textbf{\sffamily\large\@name}
			\par
			\vspace{1ex}
			\@statement
		\end{minipage}
	\end{minipage}
	\hfill
	\begin{minipage}[b]{\colr}
		% \sffamily
		% \begin{tabular}[b]{R{\linewidth - 2em} p{2em}}
		% 	\@phone & \faPhone\\
		% 	\@email & \faEnvelope\\
		% 	\@address & \faHome\\
		% \end{tabular}
		\begin{itemize}[leftmargin=*,itemsep=-2pt,label={}] \raggedleft
			\sffamily
			% \item[\faPhone] \@phone 
			% \item[\faInbox] \@email
			% % \item \mbox{\@github}
			% % \item \mbox{\@website}
			% \item[\faHome] \@address
			\item \@phone 
			\item \@email
			% \item \mbox{\@github}
			% \item \mbox{\@website}
			\item \@address
		\end{itemize}
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
	\begin{tabular}{R{\colr}!{\notstarthen{#1}{\vline height +8pt width 1pt }}L{\coll}}%
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
\titleformat{\section}{\sffamily\bfseries}{}{0pt}{\MakeUppercase}[\titlerule]
\titlespacing*{\section}{0pt}{1em}{1em}
\RenewDocumentCommand{\subsection}{m o o}{%
	\phantomsection
	\addcontentsline{toc}{subsection}{#1 \IfNoValueF{#2}{#2}}%
	\textsf{\textbf{#1} \IfNoValueF{#2}{#2} \dotfill \IfNoValueF{#3}{\small{#3}}}%
	\par
	\smallskip
}
% \titlespacing*{\subsection}{0pt}{2ex plus 4pt minus 4pt}{2ex plus 4pt minus 4pt}
% \NewDocumentCommand{\titleemph}{m}{$\ast$ #1 $\ast$}
% \titleformat{\subsubsection}{\mdseries\sffamily\centering}{}{0pt}{}
\RenewDocumentCommand{\subsubsection}{m}{%
	\phantomsection
	\addcontentsline{toc}{subsubsection}{#1}%
	{\centering \textsf{\textmd{$\ast$ #1 $\ast$}} \par}%
	\smallskip
}
% \titlespacing*{\subsubsection}{0pt}{1em}{1em}
% \titlespacing*{\subsubsection}{0pt}{0.1\baselineskip plus 4pt minus 4pt}{0.4\baselineskip plus 4pt minus 4pt}
%
%
\NewDocumentCommand{\skillmark}{}{\rule{2ex}{2ex}}
\NewDocumentCommand{\skill}{mO{3}}{%
	% \parbox{\textwidth}{%
		\vspace{0.4\baselineskip plus 1ex minus 1 ex}%
		#1 
		\hfill 
		\foreach \x in {1,2,3}{%
			\hspace{\smallskipamount} \ifnumgreater{\x}{#2}{\color{body!30}}{\color{body}}\skillmark
		}%
		\par
	% }%
}
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
	\parbox{\coll}{\begin{itemize*}[itemjoin=\hspace{2ex}]\BODY\end{itemize*}}
}
%
%
\newlength{\entrytopspace}
\setlength{\entrytopspace}{0.4\baselineskip}
\NewDocumentEnvironment{entrylist}{s}{%
	\renewcommand{\labelitemi}{\color{black!70}\rule{1ex}{1ex}}%
	\IfBooleanT{#1}{%
		\vspace{-\entrytopspace}
	}
	\begin{itemize}[leftmargin=*,itemsep=-2pt, topsep=\entrytopspace]
}{%
	\end{itemize}%
}
%
%

\newcommand{\desclabel}[1]{\emph{#1:}}




