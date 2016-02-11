
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Jordan Melendez
% OSU Physics Graduate School Homework Template 2016
% jamhomework.cls
% Based partially on the Altermundus tkz-doc.cls found here:
% http://altermundus.com/pages/downloads/index.html
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\newcommand*{\PackageName}{jamhomework}
\newcommand*{\PackageVersion}{0.2}
\newcommand*{\filedate}{2016/01/03}

% IDENTIFICATION

\NeedsTeXFormat{LaTeX2e}[2016/1/01]
\ProvidesClass{\PackageName}%
[\filedate\space Version:\space\PackageVersion\space Jordan Melendez's Homework Class]
\LoadClass[twoside]{report}
\PassOptionsToPackage{usenames,dvipsnames,svgnames}{xcolor}
\RequirePackage{etex}
\RequirePackage[utf8]{inputenc}
\RequirePackage{xkeyval}[2005/11/25] 
\RequirePackage{framed,eso-pic}
\RequirePackage{textcomp}
% Math packages
\RequirePackage{amsmath,amssymb,amsthm,mathrsfs,mathtools}
% Physics packages
\RequirePackage{physics,simplewick,tensor,slashed,esint}
% Main Font
\RequirePackage{fourier} % Some like the [upright] option for capital math letters. I do not.
\RequirePackage[T1]{fontenc}
% Fun symbols/pictures
\RequirePackage{marvosym}
\RequirePackage{pifont}
% For problem headings, etc.
\RequirePackage[scaled=0.85]{berasans}
\RequirePackage[scaled=0.85]{beramono}
% Other fonts
\RequirePackage{dsfont}
% Units
\RequirePackage{siunitx}
% Other
\RequirePackage[bottom,stable,ragged]{footmisc}
\RequirePackage{comment}
\RequirePackage{enumitem}
\RequirePackage{xifthen}
\RequirePackage{fancyhdr}
\RequirePackage{etoolbox}
\RequirePackage{lipsum}
% Redefine page margins
\RequirePackage[centering,top=1in,bottom=1in,left=1in,right=1in]{geometry}
% Hyperlinks
\RequirePackage{hyperref}
% I don't like the \mathcal font given by fourier
% This changes the font back and scales it appropriately:
\DeclareFontFamily{OMS}{fcmsy}{\skewchar\font48 }
\DeclareFontShape{OMS}{fcmsy}{m}{n}{%
         <-5.5> [.942] cmsy5     <5.5-6.5> [.942] cmsy6
      <6.5-7.5> [.942] cmsy7     <7.5-8.5> [.942] cmsy8
      <8.5-9.5> [.942] cmsy9     <9.5->  [.942] cmsy10
      }{}
\DeclareFontShape{OMS}{fcmsy}{b}{n}{%
       <-6> [.942] cmbsy5
      <6-8> [.942] cmbsy7
      <8->  [.942] cmbsy10
      }{}
\DeclareMathAlphabet{\mathcal}{OMS}{fcmsy}{m}{n}

%=============== Headers/Footers ===============%

\pagestyle{fancy}
\fancyhead[RO,LE]{\small\thepage}
\fancyhead[LO]{\small \@author}% odd page header and number to right top
\fancyhead[RE]{\small \@assignment}%Even page header and number at left top
\fancyfoot[L,R,C]{}
\renewcommand{\headrulewidth}{0pt}% disable the underline of the header part

%=============== Counters ===============%

\newcounter{ProblemNum}
\newcounter{SubProblemNum}[ProblemNum]
\setcounter{ProblemNum}{1}

\renewcommand{\theProblemNum}{\arabic{ProblemNum}}
\renewcommand{\theSubProblemNum}{\alph{SubProblemNum}}

%=============== Fancy Sections (disabled) ===============%

\begin{comment}
\usepackage{titlesec}
\titleformat{\section}[frame] 
{\normalfont}
{\filright\footnotesize\enspace SECTION \thesection\enspace} 
{8pt} 
{\Large\bfseries\filcenter}
\titleformat{\subsection}[block] {\large\bfseries\filright}{\fbox{\thesubsection}}{2em}{}%
\end{comment}

%=============== Tikz stuff ===============%

\RequirePackage{calc}
\RequirePackage{tikz}
% We need lots of libraries...
\usetikzlibrary{%
  arrows,%
  calc,%
  fit,%
  patterns,%
  plotmarks,%
  shapes.geometric,%
  shapes.misc,%
  shapes.symbols,%
  shapes.arrows,%
  backgrounds,%
  topaths,%
  trees,%
  matrix,%
  folding,%
  fadings,%
  through,%
  positioning,%
  scopes,%
  decorations.shapes,%
  decorations.text,%
  decorations.pathreplacing,%
  decorations.pathmorphing,%
  decorations.markings,%
  shadows} 
  
\RequirePackage{multido}
\RequirePackage{lscape}
\RequirePackage{graphicx}
\RequirePackage{array}
\RequirePackage{multicol}
\RequirePackage{multirow} 
\RequirePackage{tabularx,ragged2e}
\RequirePackage{booktabs}
\RequirePackage[bottom,stable,ragged]{footmisc}


\raggedbottom 

%=============== Colors ===============%

% Color scheme for environments
\colorlet{textcolor}{black}
\colorlet{framecolor}{black}
\colorlet{primarycolor}{blue!30}
\colorlet{secondarycolor}{blue!15}
% Not used...
\definecolor{fondpaille}{cmyk}{0,0,0.1,0}
\definecolor{bistre}{rgb}{.75,.50,.30}
\providecolor{bistre}{rgb}{.75,.50,.30}
\colorlet{graphicbackground}{fondpaille}
\colorlet{codebackground}{fondpaille!92!Maroon} 
\colorlet{sectioncolor}{Maroon}
\colorlet{titlecolorbox}{fondpaille!92!Maroon}
\colorlet{titlecolorbox2}{fondpaille!80!black}  
\colorlet{pdflinkcolor}{blue}
\colorlet{pdfurlcolor}{blue}
\colorlet{pdffilecolor}{Peach}
\colorlet{stringcolor}{green!40!black!100}
\colorlet{commencolor}{blue!0!black!100}


%=============== Math definitions, etc. ===============%

\newcommand{\Lagr}{\mathcal{L}}
\newcommand{\Ham}{\mathcal{H}}

% Sum + Integral symbol
\DeclareMathOperator*{\SumInt}{%
\mathchoice%
  {\ooalign{$\displaystyle\sum$\cr\hidewidth$\displaystyle\int$\hidewidth\cr}}
  {\ooalign{\raisebox{.14\height}{\scalebox{.7}{$\textstyle\sum$}}\cr\hidewidth$\textstyle\int$\hidewidth\cr}}
  {\ooalign{\raisebox{.2\height}{\scalebox{.6}{$\scriptstyle\sum$}}\cr$\scriptstyle\int$\cr}}
  {\ooalign{\raisebox{.2\height}{\scalebox{.6}{$\scriptstyle\sum$}}\cr$\scriptstyle\int$\cr}}
}

% If you want filled black squares for proofs:
%\renewcommand{\qedsymbol}{\hfill\ensuremath{\blacksquare}}

% If you want a bold, upright "Proof." in the proof environment:
%\renewcommand*{\proofname}{\textbf{\textup{Proof.}}}

%=============== Problem/Exercise Environment ===============%

\let\fram@d=\MakeFramed  \let\endfram@d=\endMakeFramed

\newcommand*{\ActivBoxName}{}

\newenvironment{problem}[1][\@nil]{%
%\parindent=0pt   % If uncommented, new paragraphs are not indented
\def\FrameCommand{\color{framecolor}
{\vrule width 1pt\hspace{5pt}}%
}%
\MakeFramed{\advance\hsize-\width\FrameRestore}%
\noindent
\makebox[0pt][l]{%

\hspace{-6pt}%
\setlength{\fboxrule}{1pt}%
\setlength{\fboxsep}{3pt}%
\fcolorbox{framecolor}{primarycolor}{% Numbered box
\rule{4pt}{0pt}%
\makebox[\width+4pt][l]{%
 \strut\textbf{\texttt{{\theProblemNum}}}}%
}%
\def\BoxName{#1}%
\ifx\BoxName\@nnil% If no argument, ignore second box. Otherwise make it.
\else%
  \hspace{-1pt}%
  \fcolorbox{framecolor}{secondarycolor}{%
  \rule{6pt}{0pt}%
  \makebox[\width+6pt][l]{%
  \strut\textbf{\texttt{{\BoxName}}}}% The text that goes in the box
  }%
  \fi%
\refstepcounter{ProblemNum}%
}\\*[.5\baselineskip]
\color{framecolor}}{% The lower bounding of the environment
\par\noindent%
\makebox[0pt][l]{%

\hspace{-6pt}%
\rule{6pt}{1pt}%
\rule{\textwidth}{1pt}%

\hspace{-1pt}%
\rule{1pt}{10pt}%
}%
\endMakeFramed
\noindent
\ignorespacesafterend
%\par\medskip
}

%=============== Boxparts and Parts Environments ===============%
% Useful for numbering solutions without entering an environment like enumerate

% Spacing vertically around words like \strut. I don't think this is used here anymore
\newcommand*{\mystrut}{\rule[-.04\baselineskip]{0pt}{.56\baselineskip}}

\newcommand{\LeftMargin}{0pt}% Start with no indentations
\newcommand{\theLabel}[1]{\gdef\@theLabel{#1}}
\newenvironment{boxparts}[1][\@nil]{%
	\def\theArg{#1}%
	% Now check the argument and determine the labels
	\theLabel{\arabic}
	\ifx\theArg\@nnil
	\else
		\ifthenelse{\equal{\theArg}{a}}{%
			\theLabel{\alph}
		}{%
			\ifthenelse{\equal{\theArg}{r}}{%
				\theLabel{\roman}
			}{%
				\ifthenelse{\equal{\theArg}{A}}{%
					\theLabel{\Alph}
				}{%
					\ifthenelse{\equal{\theArg}{R}}{%
						\theLabel{\Roman}
					}{%
						% If unrecognized argument, use \arabic
					}%
			}{%
				}%
			}%
		}%
	\fi
	\begin{enumerate}[% The typesetting options for enumerate
		label={{\framebox[13pt]{\@theLabel*}}},% [13pt] sets box width and thus will not stretch
		leftmargin=\LeftMargin,%
		rightmargin=0pt,%
		listparindent=\parindent,%
		parsep=0pt,%
		labelwidth=20pt%
		]%
	\renewcommand*{\LeftMargin}{12pt+.5em}% If there are nested boxparts, indent the second
	\ignorespaces%
}{%
	\end{enumerate}%
	\ignorespacesafterend%
}

\newenvironment{parts}[1][\@nil]{%
	\def\theArg{#1}%
	% Now check the argument and determine the labels
	\theLabel{\arabic}
	\ifx\theArg\@nnil
	\else
		\ifthenelse{\equal{\theArg}{a}}{%
			\theLabel{\alph}
		}{%
			\ifthenelse{\equal{\theArg}{r}}{%
				\theLabel{\roman}
			}{%
				\ifthenelse{\equal{\theArg}{A}}{%
					\theLabel{\Alph}
				}{%
					\ifthenelse{\equal{\theArg}{R}}{%
						\theLabel{\Roman}
					}{%
						% If unrecognized argument, use \arabic
					}%
			}{%
				}%
			}%
		}%
	\fi
	\begin{enumerate}[% The typesetting options for enumerate
		label={(\@theLabel*)},%
		leftmargin=\LeftMargin,%
		rightmargin=0pt,%
		listparindent=\parindent,%
		parsep=0pt,%
		%labelwidth=20pt%
		]%
	\renewcommand*{\LeftMargin}{12pt+.5em}% If there are nested parts, indent the second
	\ignorespaces%
}{%
	\end{enumerate}%
	\ignorespacesafterend%
}

%=============== fancyTitle Environment ===============%
% The main component of \maketitle

% More spacing
\newcommand*{\mystrutTwo}{\rule[-.04\baselineskip]{0pt}{.9\baselineskip}}

\newenvironment{fancyTitle}[1][\@nil]{%
\parindent=0pt
\def\FrameCommand{\color{framecolor}
{\vrule width 1pt\hspace{5pt}}% Options for MakeFramed
}%
\MakeFramed{\advance\hsize-\width\FrameRestore}%
\noindent
\makebox[0pt][l]{%

\hspace{-6pt}%
\setlength{\fboxrule}{1pt}%
\setlength{\fboxsep}{3pt}%
\fcolorbox{framecolor}{primarycolor}{% Big box
\rule{0pt}{0pt}%
\makebox[\width][c]{%
 \mystrutTwo\Large\ding{118}}% The large symbol in box
}%
\def\BoxName{#1}%
\ifthenelse{\equal{\@course}{\@empty}}{}{% If no argument, ignore second box. Otherwise make it.
  \hspace{6pt}%
  \makebox[\width+6pt][l]{%
  \mystrutTwo\Large\textbf{\textsf{{\BoxName}}}}%
  }%
}\\*[.3\baselineskip]
\color{textcolor}}{%
%
\noindent
\makebox[0pt][l]{%
\hspace{-6pt}%
\setlength{\fboxrule}{1pt}%
\setlength{\fboxsep}{3pt}%
\fcolorbox{framecolor}{secondarycolor}{% Small box
\rule{1pt}{3pt}% The small symbols in small box
\makebox[3pt][r]{\rule{1pt}{3pt}}% and here
}%
}
\endMakeFramed
\ignorespacesafterend
}

%=============== Maketitle ===============%

% Defines fields useful for homework, etc.
\newcommand{\email}[1]{\def\@email{#1}}
\newcommand{\course}[1]{\def\@course{#1}}
\newcommand{\assignment}[1]{\def\@assignment{#1}}

% Starts fields as empty unless defined by user
\let\@author\@empty
\let\@email\@empty
\let\@course\@empty
\let\@assignment\@empty
\let\@date\@empty

% Defines a new fancy \maketitle
\renewcommand\maketitle{%
\thispagestyle{empty}% Removes headers/footers from first page
\vspace*{-.82in} % Moves header closer to top of page
\begin{fancyTitle}[\@course]% The course on first line
% If fields are empty, ignore them. Otherwise, place in the maketitle
\noindent\ifthenelse{\equal{\@author}{\@empty}}{}{~\Gentsroom\hspace{2.53mm}\@author\newline}%
\noindent\ifthenelse{\equal{\@email}{\@empty}}{}{\Letter\hspace{1.7mm}\@email\newline}%
%\noindent\ifthenelse{\equal{\@course}{\@empty}}{}{\Info~~\@course\newline}%
\noindent\ifthenelse{\equal{\@assignment}{\@empty}}{}{\ding{47}\hspace{1.52mm}\@assignment\newline}%
\noindent\ifthenelse{\equal{\@date}{\@empty}}{}{\ClockLogo\hspace{2.05mm}\@date\newline}%
\end{fancyTitle}%
}

%%%%%%%%%%%%
\endinput
%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%
%
%          End of file `jamhomework.cls'.
%
%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%
