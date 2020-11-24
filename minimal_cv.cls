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
%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% Column layout %%%%
%%%%%%%%%%%%%%%%%%%%%%%%
\newlength{\colr}
\newlength{\coll}
\NewDocumentCommand{\layout}{m O{7mm}}{%
       \setlength{\coll}{#1}
       \setlength{\colr}{\textwidth - \coll - #2}
}
\layout{0.7\textwidth}
%
%
\NewDocumentEnvironment{leftcol}{O{0.7}}{%
	\noindent
	\begin{minipage}[t]{\coll}\raggedright \
}{%
	\end{minipage}%
	\hfill
}
\NewDocumentEnvironment{rightcol}{}{%
	\newlength{\availablev}
	\setlength{\availablev}{%
		\the\dimexpr\textheight-0.2in-\pagetotal\relax
	}%
	\begin{minipage}[t]{\colr}\
}{%
	\end{minipage}
}
%%%%%%%%%%%%%%%%%%%%%%%%
% Personal information %
%%%%%%%%%%%%%%%%%%%%%%%%
\newlength{\logowidth}
\setlength{\logowidth}{14mm}
\NewDocumentCommand{\personnel}{}{%
	\includegraphics[align=c,width=\logowidth]{\@logo}
	\hfill
	\begin{minipage}[c]{\linewidth - \logowidth - 2ex}
		\sffamily
		\textbf{\sffamily\large\@name}
		\par
		\vspace{1ex}
		\@statement
	\end{minipage}
}
\NewDocumentCommand{\contacts}{}{%
	\begin{itemize}[leftmargin=*,itemsep=-2pt,label={}] \raggedleft
		\sffamily
		\item \@phone 
		\item \@email
		\item \@address
	\end{itemize}
}
\NewDocumentCommand{\showinfo}{O{3em}}{%
	\noindent
	\begin{minipage}[b][][c]{\coll}
		\personnel
	\end{minipage}
	\hfill
	\begin{minipage}[b]{\colr}
		\contacts
	\end{minipage}
}
%%%%%%%%%%%%%%%%%%%%%%%%
%%%% Section style  %%%%
%%%%%%%%%%%%%%%%%%%%%%%%
% Section
\titleformat{\section}{\sffamily\bfseries}{}{0pt}{\MakeUppercase}[\titlerule]
\titlespacing*{\section}{0pt}{1em}{1em}
\let\oldsection\section
\RenewDocumentCommand{\section}{o m}{%
	\oldsection[\IfNoValueTF{#1}{#2}{#1}]{#2}
	\@ifnextchar\subsection{\vspace{-\smallskipamount}}{}
}
% Subsection
\RenewDocumentCommand{\subsection}{o m o o}{%
	\phantomsection
	\smallskip
	\addcontentsline{toc}{subsection}{\IfNoValueTF{#1}{#2}{#1} \IfNoValueF{#3}{#3}}%
	\textsf{\textbf{#2}\IfNoValueF{#3}{, #3} \dotfill \IfNoValueF{#4}{\small{#4}}}%
	\par
	\@ifnextchar\subsubsection{\medskip}{\smallskip}
}
% Subsubsection
\RenewDocumentCommand{\subsubsection}{m}{%
	\phantomsection
	\smallskip
	\addcontentsline{toc}{subsubsection}{#1}%
	{\centering \textsf{\textmd{$\ast$ #1 $\ast$}} \par}%
	\smallskip
}
%%%%%%%%%%%%%%%%%%%%%%%%
%%%%  Skills style  %%%%
%%%%%%%%%%%%%%%%%%%%%%%%
\NewDocumentCommand{\skillmark}{}{\rule{2ex}{2ex}}
\NewDocumentCommand{\skill}{mO{3}}{%
	\vspace{0.4\baselineskip plus 1ex minus 1 ex}%
	#1 
	\hfill 
	\foreach \x in {1,2,3}{%
		\hspace{\smallskipamount} \ifnumgreater{\x}{#2}{\color{body!30}}{\color{body}}\skillmark
	}%
	\par
}
%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%  List style  %%%%%
%%%%%%%%%%%%%%%%%%%%%%%%
\newlength{\entrytopspace}
\setlength{\entrytopspace}{0.4\baselineskip}
\NewDocumentEnvironment{entrylist}{s}{%
	% \renewcommand{\labelitemi}{\color{black!70}\rule{1ex}{1ex}}%
	\IfBooleanT{#1}{%
		\vspace{-\entrytopspace}%
	}
	\begin{itemize}[leftmargin=*,itemsep=-2pt, topsep=\entrytopspace, partopsep=0pt]
}{%
	\end{itemize}%
}
%
%



