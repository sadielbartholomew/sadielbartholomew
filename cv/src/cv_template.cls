%%%%%%%%%%%%%%%%
% Adapted from the original template described below, AltaCV, in
% April 2019 and then December 2020 by Sadie L. Bartholomew
% (github.com/sadielbartholomew).

% Note also there are updated versions of the original template
% used available on GitHub (https://github.com/liantze/AltaCV)
% though this template has diverged from ALtaCV after v1.1.3.
%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%
% Template: altacv.cls (v1.1.3, 30 April 2017) written by
% LianTze Lim (liantze@gmail.com).
%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{cv_template}[Dec. 2020 minor modification to LianTze Lim's AltaCV protocol class by Sadie Bartholomew]

\LoadClass{extarticle}

\RequirePackage[margin=2cm]{geometry}
\RequirePackage{fontawesome}

\RequirePackage{xcolor}
\colorlet{accent}{blue!90!black}
\colorlet{heading}{black}
\colorlet{emphasis}{black}
\colorlet{body}{black!80!white}
\newcommand{\itemmarker}{{\small\textbullet}}
\newcommand{\ratingmarker}{\faCircle}

\RequirePackage{tikz}
\usetikzlibrary{arrows}
\RequirePackage[skins]{tcolorbox}
\RequirePackage{enumitem}
\setlist{leftmargin=*,labelsep=0.5em,nosep,itemsep=0.25\baselineskip,after=\vskip0.25\baselineskip}
\setlist[itemize]{label=\itemmarker}
\RequirePackage{graphicx}
\RequirePackage{etoolbox}
\RequirePackage{dashrule}
\RequirePackage{multirow,tabularx}
\RequirePackage{changepage}

% Purely to make a few mathematical symbols bold i.e. to get 'boldsymbol' command
\RequirePackage{amsmath}

% Use paracol package to allow for multiple columns spanning
% multiple pages independently
\usepackage{paracol}

% This requires certain LaTeX compilers to work. e.g. the XeLaTeX compiler
\usepackage{academicons}

\usepackage{amssymb}
\usepackage{wasysym}
\usepackage{textcomp}

\setlength{\parindent}{0pt}
\newcommand{\divider}{\textcolor{body!30}{\hdashrule{\linewidth}{0.6pt}{0.5ex}}\medskip}

\newcommand{\makesubtitle}[1]{{\color{Bright}\textbf{#1}}}

\newcommand{\drawfullcircle}[1]{{\color{#1}\CIRCLE}}
\newcommand{\drawhalfcircle}[1]{{\color{#1}\LEFTCIRCLE}}
\newcommand{\repeated}[2]{\count0=#1 \loop \ifnum\count0>0 \advance\count0 by -1 \hspace{0.4ex}#2\repeat}
\newcommand{\circlebardisplay}[6]{
\repeated{#1}{\drawfullcircle{Black}}\repeated{#2}{\drawhalfcircle{Black}} |
\repeated{#3}{\drawfullcircle{Green}}\repeated{#4}{\drawhalfcircle{Green}} |
\repeated{#5}{\drawfullcircle{Bright}}\repeated{#6}{\drawhalfcircle{Bright}}
}

\newcommand{\printauth}[4]{\mbox{\textcolor{emphasis}{
#1} \hspace{0.5em} (\textcolor{accent}{#2}\hspace{0.5em}#3)\hspace{0.5em} \textcolor{emphasis}{on #4}}}
\newcommand{\printadditions}[4]{\mbox{\textcolor{body}{#1} \hspace{0.5em} \textcolor{body}{(#2}\hspace{0.5em}#3)\hspace{0.5em} \textcolor{body}{on #4}}}

\newcommand{\name}[1]{\def\@name{#1}}
\newcommand{\made}[1]{\def\@made{#1}}
\newcommand{\tagline}[1]{\def\@tagline{#1}}
\newcommand{\logo}[2]{\def\@logo{#2}\def\@logodiameter{#1}}

\newcommand{\madeby}[3]{\printauth{#1}{\mailsymbol}{#2}{#3}}
\newcommand{\addedto}[3]{\printadditions{#1}{\mailsymbol}{#2}{#3}}

\newcommand{\purpose}[1]{\def\@purpose{#1}}

\newcommand{\docinfo}[1]{\def\@docinfo{#1}}

\newcommand{\makeheader}{%
  \begingroup
    \ifdef{\@logodiameter}{\begin{minipage}{\dimexpr\linewidth-\@logodiameter}}{}%
    \raggedright\color{emphasis}%
    {\Huge\bfseries\MakeUppercase{\@name}\par}
    \medskip
    {\large\bfseries\color{accent}\@tagline\par}
    \medskip
    {\bfseries\@docinfo\par}
    \end{minipage}\hfill%
    \ifdef{\@logodiameter}{%
    \begin{minipage}{\@logodiameter}
      \includegraphics[width=\linewidth]{\@logo}
    \vfill%
    \end{minipage}\par}{}%
  \endgroup\medskip
}

\renewenvironment{quote}{\color{accent}\itshape\large}{\par}

\newcommand{\need}[2][]{%
  \bigskip%
	\medskip
  \ifstrequal{#1}{}{}{\marginpar{\vspace*{\dimexpr1pt-\baselineskip}\raggedright\input{#1}}}%
  {\color{heading}\Large\bfseries\MakeUppercase{#2}}\\[-1ex]%
  {\color{heading}\rule{\linewidth}{2pt}\par}\medskip
}

\newcommand{\protosubsection}[1]{%
  \smallskip%
  {\color{emphasis}\large\bfseries{#1}\par}\medskip
}

\newcommand{\step}[3]{%
  \color{emphasis}{#1}
  {\large\color{emphasis}#2}
  \hspace{5em}
  \color{emphasis}{\footnotesize  [#3]\par}
  \smallskip
  \textbf{\color{accent}{#2} }\par
  \smallskip
}

\newcommand{\steptwo}[5]{%
  \color{emphasis}{#1}
  {\large\color{emphasis}#2}
  \hspace{#3em}
  \color{emphasis}{\footnotesize  [#4]\par}
  \textbf{\color{accent}{#5} }\par
  \smallskip
}

\newcommand{\stepthree}[4]{%
  \color{emphasis}{#1}
  {\large\color{emphasis}#2}
  \hspace{#3em}
    \color{emphasis}{\footnotesize  [#4]\par}
  \smallskip
}

\newcommand{\itemtag}[1]{%
  \tikz[baseline]\node[anchor=base,draw=body!30,rounded corners,inner xsep=1ex,inner ysep =0.75ex,text height=1.5ex,text depth=.25ex]{#1};
}

\newcommand{\risk}[2]{%
\textcolor{emphasis}{\textbf{#1}}\hfill
\foreach \x in {1,...,5}{%
  \space{\ifnumgreater{\x}{#2}{\color{body!30}}{\color{accent}}\faCircle}}\par%
}

\newcommand{\protoref}[3]{%
  \smallskip
  \textcolor{emphasis}{\textbf{#1}}\par
  \begin{description}[font=\color{accent},style=multiline,leftmargin=1.25em]
  \item[\slowsymbol] #2
  \item[\small\slowsymbol] #3
  \end{description}
}

\newenvironment{protocolumn}[1]{\begin{minipage}[t]{#1}\raggedright}{\end{minipage}}

\RequirePackage{afterpage}
\newcommand{\addsidebar}[2][]{\marginpar{%
  \ifstrequal{#1}{}{}{\vspace*{#1}}%
  \input{#2}}%
}

\newcommand{\addnextpagesidebar}[2][]{\afterpage{\addsidebar[#1]{#2}}}

\newcommand{\grade}[1]{
  \begin{tikzpicture}
    \clip (1em-.4em,-.35em) rectangle (5em +.5em ,1em);
    \foreach \x in {1,2,...,5}{
        \path[{fill=body!30}] (\x em,0) circle (.35em);
    }
    \begin{scope}
    \clip (1em-.4em,-.35em) rectangle (#1em +.5em ,1em);
    \foreach \x in {1,2,...,5}{
        \path[{fill=accent}] (\x em,0) circle (.35em);
    }
    \end{scope}
  \end{tikzpicture}
}

\AtBeginDocument{
  \pagestyle{empty}
  \color{body}
  \raggedright
}