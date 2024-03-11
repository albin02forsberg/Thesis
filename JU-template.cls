% ******************************************************
% Identification
% ******************************************************
\def\classversion{1.0}
\def\classdate{Mars 7, 2024}

\typeout{Document class version: \classversion}
\typeout{Last modified: \classdate}
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{JU-template}

% ******************************************************
% Declare Options
% ******************************************************
% Do not know how to handle other options and therefore
% just pass them on to 'book'
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}

% ******************************************************
% Process Options
% ******************************************************
\ProcessOptions*

% ******************************************************
% Load Used Packages and Classes
% ******************************************************
\LoadClass{scrreprt}
\RequirePackage{graphicx}
\RequirePackage{fancyhdr}
\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{amssymb}
\RequirePackage{ifthen}
\RequirePackage[sectionbib]{bibunits}
\usepackage[utf8]{inputenc}
%\RequirePackage[latin1]{inputenc}
\RequirePackage{anyfontsize}
\RequirePackage{newtxtext, newtxmath}
\RequirePackage{color}
\RequirePackage{titlesec}
\RequirePackage[font=small,labelfont=bf]{caption}
% \RequirePackage[style=apa]{biblatex}


% ******************************************************
% Start defining and redefining old book style stuff
% ******************************************************

\setlength{\topmargin}{0in}
\setlength{\textwidth}{6.25in}
\setlength{\textheight}{8.75in}
\setlength{\evensidemargin}{-4.5mm}
\setlength{\oddsidemargin}{5.5mm}
\setcounter{tocdepth}{3}
\setcounter{topnumber}{2}
\setcounter{totalnumber}{3}
\renewcommand{\thechapter}{\arabic{chapter}}
\renewcommand{\thesection}{\arabic{chapter}.\arabic{section}}
\renewcommand{\thesubsection}{\arabic{chapter}.\arabic{section}.
                              \arabic{subsection}}
\renewcommand{\thesubsubsection}{\arabic{chapter}.\arabic{section}.
                                 \arabic{subsection}.\arabic{subsubsection}}
\renewcommand{\theequation}{\arabic{chapter}.\arabic{equation}}
\renewcommand{\thefigure}{\arabic{chapter}.\arabic{figure}}
\renewcommand{\thetable}{\arabic{chapter}.\arabic{table}}
\renewcommand{\topfraction}{.95}
\renewcommand{\textfraction}{.05}
\renewcommand{\floatpagefraction}{.75}
\renewcommand{\jot}{.6\baselineskip}
\setlength{\intextsep}{12pt}
\setlength{\headheight}{2pt}

% Text size
\renewcommand{\normalsize}{\fontsize{12}{14.4}\selectfont}
\renewcommand{\large}{\fontsize{12}{16.8}\selectfont}
\renewcommand{\Large}{\fontsize{12}{21.6}\selectfont}
\renewcommand{\LARGE}{\fontsize{12}{26.4}\selectfont}
\renewcommand{\huge}{\fontsize{14}{31.2}\selectfont}
\renewcommand{\Huge}{\fontsize{18}{36}\selectfont}

% Figure and table captions
\renewcommand{\figurename}{Figure}
\renewcommand{\tablename}{Table}
\renewcommand{\bibname}{References}

% Figure caption size





\newcommand{\ischapter}{1} % 1=chapters, 0=papers (used in contents page generation)


% ------------------------------------------
% Make figure captions \it and \small
% ------------------------------------------


% ------------------------------------------
% Remove text indentation and justify evenly
% -----------------------------------------
\setlength{\parindent}{0pt}
\setlength{\parskip}{0pt plus 1pt}



% ------------------------------------------
% The \startpreamble command.
% Generates all the stuff before the first
% "real" chapter starts, like Abstract,
% Title page, TOC, etc..
% ------------------------------------------
\newcommand{\startpreamble}[8]
{
  \pagestyle{plain}
  \thispagestyle{empty} 
  \includegraphics[width=0.4\textwidth]{./Images/ju.png}
        \vspace{2cm}
        
        % 40pt font size
        \fontsize{40}{40}\selectfont
        \textbf{Bachelors Thesis Name}
        
        \vspace{0.5cm}
        \LARGE
        Maybe Subtitle
        
        \vfill
        \small
        % No indent
        \noindent
        \textbf{Main Subject Area:} Computer Science \\
        \textbf{Author:} \theauthor \\
        \textbf{\supervisorstring} \supervisors \\
        \textbf{JÖNKÖPING} 2024 03
        \clearpage

        \vfill
        \setcounter{page}{1}
        \pagenumbering{roman}
        % Place at bottom of page
        \vspace*{\fill}
        
        \noindent
        This final thesis has been carried out at the School of 
        Engineering at Jönköping University within Computer Engineering. 
        The authors are responsible for the presented opinions, conclusions
        and results.

        \vspace{2cm}

        \noindent
        \textbf{Examiner:} Bilal \\
        \textbf{Supervisor:} \supervisors \\
        \textbf{Scope:} 15 hp (first-cycle education) \\
        \textbf{Date:} \today

   %--- Make abstract page
    \addcontentsline{toc}{chapter}{Abstract}
   \noindent #6

   \clearpage

   \pagenumbering{arabic}

   %--- Make Table of Conents
  \renewcommand{\contentsname}{
                Table of Contents}
    
    % Add to TOC
    \addcontentsline{toc}{chapter}{Table of Contents}
    \tableofcontents

   \clearpage
}

% ------------------------------------------
% Make \startchapters command
% ------------------------------------------
\newcommand{\startchapters}
{
 \cleardoublepage
 \renewcommand{\chaptername}{Chapter}
 \renewcommand{\ischapter}{1}
 \pagestyle{fancy}
 \fancyhf{}
 \fancyhead[RE]{}
 \fancyhead[LO]{}
 \fancyhead[LE]{\thepage} 
 \fancyhead[RO]{\thepage}
}

% ------------------------------------------
% Make \startpapers command
% ------------------------------------------
\newcommand{\startpapers}
 {
  % ------------------------------------------
  % Adjust section headings
  % ------------------------------------------
  \renewcommand\section{\@startsection {section}{1}{-1pt}%
                                   {-3.5ex \@plus -1ex \@minus -.2ex}%
                                   {2.3ex \@plus.2ex}%
                                   {\Large\bfseries}}

  \renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.5ex \@plus .2ex}%
                                     {\large\bfseries}}
  \renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.5ex \@plus .2ex}%
                                     {\normalsize\bfseries}}

  %\setcounter{secnumdepth}{3}
  \renewcommand{\thesection}{\arabic{section}}
  \renewcommand{\thesubsection}{\arabic{section}.\arabic{subsection}}
  \renewcommand{\thesubsubsection}{\arabic{section}.\arabic{subsection}.
                                   \arabic{subsubsection}}
  \renewcommand{\theequation}{\arabic{equation}}
  \renewcommand{\thefigure}{\arabic{figure}}
  \renewcommand{\thetable}{\arabic{table}}
  \renewcommand{\chaptername}{Paper}
  \renewcommand{\thechapter}{\textnormal{\Alph{chapter}}}
  \setcounter{chapter}{0}
  \def\bibname{References}
  \renewcommand{\ischapter}{0}
  \pagestyle{fancy}
  \fancyhf{}
  \fancyhead[RE]{}
  \fancyhead[LO]{}
  \fancyhead[LE]{\thepage} 
  \fancyhead[RO]{\thepage}
}

% ------------------------------------------
% Make new part page
% ------------------------------------------
\newcommand{\makepartpage}[1]{%
 \cleardoublepage
 \thispagestyle{plain}
 \vspace*{7cm}
 {\Huge\hfill #1}
 \addcontentsline{toc}{part}{#1}
 \pagestyle{fancy}
 \fancyhf{}
 \fancyhead[RE]{}
 \fancyhead[LO]{}
 \fancyhead[LE]{\thepage} 
 \fancyhead[RO]{\thepage}
 \cleardoublepage
}

% ------------------------------------------
% \makechapter command
% ------------------------------------------
\newcommand{\makechapter}[4][]
{
   % First argument is an abbreviated version
   % of the chapter name, used as page header
   % Second argument is the chapter name as it occurs in the TOC. 
   % The third argument is what is actually printed on the first page
   % of the chapter.

  % ------------------------------------------
  % Adjust section headings
  % ------------------------------------------
  \renewcommand\section{\@startsection {section}{1}{-1pt}%
                                   {-3.5ex \@plus -1ex \@minus -.2ex}%
                                   {2.3ex \@plus.2ex}%
                                   {\Large\bfseries}}

  \renewcommand\subsection{\@startsection{subsection}{2}{-6pt}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.5ex \@plus .2ex}%
                                     {\large\bfseries}}
  \renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.5ex \@plus .2ex}%
                                     {\normalsize\bfseries}}


   \renewcommand{\thechapter}{\arabic{chapter}}
   \renewcommand{\thesection}{\arabic{chapter}.\arabic{section}} 
   \renewcommand{\thesubsection}{
                 \arabic{chapter}.\arabic{section}.\arabic{subsection}}
   \renewcommand{\theequation}{\arabic{chapter}.\arabic{equation}}
   \renewcommand{\thefigure}{\arabic{chapter}.\arabic{figure}}
   \renewcommand{\thetable}{\arabic{chapter}.\arabic{table}}

   \cleardoublepage
   \thispagestyle{plain}
   \chapter[#3]{#4}
}

% ------------------------------------------
% \makepaper command
% ------------------------------------------
\newcommand{\makepaper}[5]
{
   \fancyhead[RE]{}
   \fancyhead[LO]{}
   \fancyhead[LE]{\thepage} 
   \fancyhead[RO]{\thepage}
   \cleardoublepage
   \thispagestyle{plain}
   \chapter[\space]{#2}
   \vspace{25mm}
   \textbf{Authors:}\\ #3
   \vspace{10mm} \\ \noindent \textbf{Reformatted version of paper
    originally published in:} \\ #4
   \vspace{15mm} \\ \noindent{\copyright} #5
   \cleardoublepage
   \fancyhf{}
   \fancyhead[RE]{\sc{\nouppercase{#1}}}
   \fancyhead[LO]{\sc{\nouppercase{\rightmark}}}
   \fancyhead[LE]{\thepage} 
   \fancyhead[RO]{\thepage}
}

% ------------------------------------------
% \makepaperaccepted command, same as above
% for submitted, not yet accepted paper
% ------------------------------------------
\newcommand{\makepaperaccepted}[5]
{
   \fancyhead[RE]{}
   \fancyhead[LO]{}
   \fancyhead[LE]{\thepage} 
   \fancyhead[RO]{\thepage}
   \cleardoublepage
   \thispagestyle{plain}
   \chapter[\space]{#2}
   \vspace{25mm}
   \textbf{Authors:}\\ #3
   \vspace{10mm} \\ \noindent \textbf{Reformatted version of paper
    accepted for publication in:} \\ #4
   \vspace{15mm} \\ \noindent{\copyright} #5
   \cleardoublepage
   \fancyhf{}
   \fancyhead[RE]{\sc{\nouppercase{#1}}}
   \fancyhead[LO]{\sc{\nouppercase{\rightmark}}}
   \fancyhead[LE]{\thepage} 
   \fancyhead[RO]{\thepage}
}

% ------------------------------------------
% \makepapersubmitted command, same as above
% for submitted, not yet accepted paper
% ------------------------------------------
\newcommand{\makepapersubmitted}[5]
{
   \fancyhead[RE]{}
   \fancyhead[LO]{}
   \fancyhead[LE]{\thepage} 
   \fancyhead[RO]{\thepage}
   \cleardoublepage
   \thispagestyle{plain}
   \chapter[\space]{#2}
   \vspace{25mm}
   \textbf{Authors:}\\ #3
   \vspace{10mm} \\ \noindent \textbf{Reformatted version of paper
    submitted to:} \\ #4
   \vspace{15mm} \\ \noindent{\copyright} #5
   \cleardoublepage
   \fancyhf{}
   \fancyhead[RE]{\sc{\nouppercase{#1}}}
   \fancyhead[LO]{\sc{\nouppercase{\rightmark}}}
   \fancyhead[LE]{\thepage} 
   \fancyhead[RO]{\thepage}
}

% ------------------------------------------
% \makepapersubmitted command, same as above
% for submitted, not yet accepted paper
% ------------------------------------------
\newcommand{\makepapertobesubmitted}[3]
{
   \fancyhead[RE]{}
   \fancyhead[LO]{}
   \fancyhead[LE]{\thepage} 
   \fancyhead[RO]{\thepage}
   \cleardoublepage
   \thispagestyle{plain}
   \chapter[\space]{#2}
   \vspace{25mm}
   \textbf{Authors:}\\ #3
   \vspace{10mm} \\ \noindent \textbf{To be submitted.} \\
   \cleardoublepage
   \fancyhf{}
   \fancyhead[RE]{\sc{\nouppercase{#1}}}
   \fancyhead[LO]{\sc{\nouppercase{\rightmark}}}
   \fancyhead[LE]{\thepage} 
   \fancyhead[RO]{\thepage}
}

% ------------------------------------------
% \makebib command
% ------------------------------------------
\newcommand{\makebib}
{
    \def\bibname{}
    \cleardoublepage
    \fancyhead[RE]{References}
    \fancyhead[LO]{References}
    \fancyhead[LE]{\thepage} 
    \fancyhead[RO]{\thepage}
    \thispagestyle{plain}
    \chapter{References}
    \putbib
    \cleardoublepage
}

% ------------------------------------------
% \appendix command
% ------------------------------------------
\renewcommand{\appendix}%
{
  \cleardoublepage%
  \setcounter{section}{0} 
  % ------------------------------------------
  % Adjust section headings
  % ------------------------------------------
  \renewcommand\section{\@startsection {section}{1}{-1pt}%
                                   {-3.5ex \@plus -1ex \@minus -.2ex}%
                                   {2.3ex \@plus.2ex}%
                                   {\Large\bfseries}}

  \renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.5ex \@plus .2ex}%
                                     {\large\bfseries}}
  \renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.5ex \@plus .2ex}%
                                     {\normalsize\bfseries}}
  \renewcommand{\thesection}{\arabic{chapter}\Alph{section}}%
  \renewcommand{\thesubsection}{%
                \arabic{chapter}\Alph{section}.\arabic{subsection}}%
  \renewcommand{\theequation}{\arabic{chapter}\Alph{section}.\arabic{equation}}
}

% ------------------------------------------
% \paperappendix command
% ------------------------------------------
\newcommand{\paperappendix}%
{
  \setcounter{section}{0}%
  \renewcommand{\thesection}{\Alph{section}}%
  \renewcommand{\thesubsection}{\Alph{section}.\arabic{subsection}}%
  \renewcommand{\thesubsubsection}{%
                \Alph{section}.\arabic{subsection}.\arabic{\thesubsubsection}}%
  \renewcommand{\theequation}{\Alph{section}.\arabic{equation}}
}
