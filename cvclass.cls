%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Copyright (c) 2021-2023 Kuan-Yu Chang
%
% This file may be distributed and/or modified
%
% 1. under the LaTeX Project Public License and/or
% 2. under the GNU Public License.
% 
% The latest version of this file can be found at:
%     https://github.com/yu020009/curriculum_vitae
%
% Overleaf Settings
%    Compiler: pdfLaTeX
%    Tex Live version: 2022
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cvclass}[2023/08/04 v1.12 Curriculum Vitae class]
\LoadClass[10pt,a4paper]{article}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Required Packages
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage[T1]{fontenc}
\RequirePackage{microtype}
\RequirePackage{geometry}
\RequirePackage{fancyhdr}
\RequirePackage{lastpage}
\RequirePackage{titlesec}
\RequirePackage[parfill]{parskip}
\RequirePackage{graphicx}
\RequirePackage{hyperref}
\RequirePackage{enumitem}
\RequirePackage{tabularx}
\RequirePackage{multirow}
\RequirePackage{multicol}
\RequirePackage[style=ieee,maxbibnames=99,dashed=false,defernumbers=true]{biblatex}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Typesetting Document
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Margins

\geometry{left=0.75in,top=0.6in,right=0.75in,bottom=0.8in}

%% Paragraphs

\setlength{\parindent}{0pt}
\setlength{\parskip}{1em}

%% Section title

\titleformat{\section}
    {\fontfamily{ptm}\selectfont\Large\scshape\bfseries}
    {}{0em}{}[{\vspace{-2pt}\titlerule[.8pt]}]

%% Page headers and footers

\pagestyle{fancyplain}
\fancyhf{} % remove everything
\renewcommand{\headrulewidth}{0pt} % remove lines as well
\renewcommand{\footrulewidth}{0.5pt}
\lfoot{\small {\em This curriculum vitae was last updated on \@lastupdate.}
    \ifx\@latestver\empty\else
        \href{\@latestver}{[Latest version]}\fi}
\rfoot{\small Page \thepage{} of \pageref*{LastPage}}

%% List of items

\setlist[itemize]{leftmargin=1.5em,noitemsep}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Personal Information
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Variables (set to empty by default)

\let \@name \relax \def\@name{}
\let \@jobtitle \relax \def\@jobtitle{}
\let \@address \relax \def\@address{}
\let \@phone \relax \def\@phone{}
\let \@email \relax \def\@email{}
\let \@github \relax \def\@github{}
\let \@page \relax \def\@page{}
\let \@latestver \relax \def\@latestver{}
\let \@lastupdate \relax \def\@lastupdate{\today}

\def \name#1{\def\@name{#1}}
\def \jobtitle#1{\def\@jobtitle{#1}}
\def \address#1{\def\@address{#1}}
\def \phone#1{\def\@phone{#1}}
\def \email#1{\def\@email{#1}}
\def \github#1{\def\@github{#1}}
\def \latestver#1{\def\@latestver{#1}}
\def \lastupdate#1{\def\@lastupdate{#1}}

%% Formatting

\newcommand{\showphone}[1]{$\bullet$ \textbf{Phone:}~\texttt{#1}}
\newcommand{\showemail}[1]{
    {\setlength\parindent{33pt}
        $\bullet$ \textbf{Email:}~\href{mailto:#1}{\texttt{#1}}\\
    }
}
\newcommand{\showgithub}[1]{$\bullet$ \textbf{GitHub:}~\texttt{#1}}
\newcommand{\showpage}[1]{$\bullet$ \textbf{Personal Page:}~\texttt{#1}}

\newcommand{\formatphone}[1]{\textbf{Phone:} \texttt{#1}}
\newcommand{\formatemail}[1]{\textbf{Email:} \href{mailto:#1}{\texttt{#1}}}
\newcommand{\formatgithub}[1]{\textbf{GitHub:} \url{#1}}
\newcommand{\formatpage}[1]{\textbf{Personal Page:} \url{#1}}

\newcommand{\makeinfo}{
    \ifx\@name\empty\else
        {\huge \bfseries \scshape \@name} \bigskip \\
    \fi \ifx\@phone\empty\else
        \formatphone{\@phone} \\ 
    \fi \ifx\@email\empty\else
        \formatemail{\@email} \\
    \fi \ifx\@github\empty\else
        \formatgithub{\@github} \\
    \fi \ifx\@page\empty\else
        \formatpage{\@page} \\
    \fi}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Experiences
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\experience}[4]{
    % \vspace{1em}
    \begin{tabular*}{\textwidth}
        {l@{\extracolsep{\fill}}r}\textbf{#1} &  #2 \\ #3 \\ #4
    \end{tabular*}
    % \vspace{1em}
    % \begin{tabularx}{\linewidth}{Xr}
    %     \textbf{#1} & \multirow{4}{*}{\includegraphics[#5]{#6}} \\
    %     \textit{#2} \\ \textit{#3} \\ #4 \\ \underline{\textit{#7}}
    % \end{tabularx} #8
    % \vspace{-0.5em}
}
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Education
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\education}[3]{
    \begin{tabular*}
        {\textwidth}[t]{l@{\extracolsep{\fill}}r}\textbf{#1} &  {#2} \\
        {{#3}} \\
    \end{tabular*}
}
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Publications
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Bibliography source

\addbibresource{pubgen.bib}
\addbibresource{pubuda.bib}
\addbibresource{pubgpu.bib}
\addbibresource{pubrl.bib}
%% List all items
%% Reference:
%%   http://www.hansenlab.org/cv_bibliography_tex

\newcommand{\makepublications}{
    \nocite{*}
    \vspace{-0.25em}
    (*, $\dagger$, and $\ddagger$ denote equal contribution)
    \vspace{-0.75em}
    \paragraph{Reinforcement Learning}\hrulefill
    \printbibliography[heading=none,keyword=rrl]
    \paragraph{Generative Models}\hrulefill
    \printbibliography[heading=none,keyword=gen]
    \paragraph{Computer Vision}\hrulefill
    \printbibliography[heading=none,keyword=uda]
    \paragraph{Graphic Processing Unit Architecture}\hrulefill
    \printbibliography[heading=none,keyword=gpu]
    }


%% Author annotation
%% Reference:
%%   https://tex.stackexchange.com/a/561064

\renewcommand*{\mkbibcompletename}[1]{%
    \ifitemannotation{hl}{\textbf{\underline{#1}}}{%
    \ifitemannotation{comm}{#1\textbf{*}}{%
    \ifitemannotation{commd}{#1$\dagger$}{%
    \ifitemannotation{commdd}{#1$\ddagger$}{%
    \ifitemannotation{hlcommdd}{\textbf{\underline{#1}$\ddagger$}}{%
    \ifitemannotation{hlcomm}{\textbf{\underline{#1}*}}{#1}}}}}}}

%% Customized fields (map to usera, userb, etc.)

\DeclareSourcemap{
    \maps[datatype=bibtex]{
      \map{\step[fieldsource=hindex] \step[fieldset=usera,origfieldval]}
      \map{\step[fieldsource=accrate] \step[fieldset=userb,origfieldval]}
      \map{\step[fieldsource=accmetc] \step[fieldset=userc,origfieldval]}
      \map{\step[fieldsource=pdf] \step[fieldset=userd,origfieldval]}
      \map{\step[fieldsource=github] \step[fieldset=usere,origfieldval]}
      \map{\step[fieldsource=video] \step[fieldset=userf,origfieldval]}
      \map{\step[fieldsource=note] \step[fieldset=userg,origfieldval]}
    }
    \maps[datatype=bibtex, overwrite]{
        \map{
            \perdatasource{pubgen.bib}
            \step[fieldset=KEYWORDS, fieldvalue=gen, append]
        }
        \map{
            \perdatasource{pubuda.bib}
            \step[fieldset=KEYWORDS, fieldvalue=uda, append]
        }
        \map{
            \perdatasource{pubgpu.bib}
            \step[fieldset=KEYWORDS, fieldvalue=gpu, append]
        }
        \map{
            \perdatasource{pubrl.bib}
            \step[fieldset=KEYWORDS, fieldvalue=rrl, append]
        }
    }
}

%% Formatting customized fields

\newcommand{\hindexformat}[1]{[H-index: \textbf{#1}]}
\newcommand{\accrateformat}[1]{[Acceptance Rate: \textbf{#1}]}
\newcommand{\accmetaformat}[1]{\textcolor{Plum}{\textbf{(#1)}}}
\newcommand{\pdfformat}[1]{\textcolor{Blue}{\href{#1}{[paper]}}}
\newcommand{\githubformat}[1]{\textcolor{Blue}{\href{#1}{[github]}}}
\newcommand{\videoformat}[1]{\textcolor{Blue}{\href{#1}{[video]}}}
\newcommand{\noteformat}[1]{\textcolor{Blue}{\textbf{(#1)}}}

\DeclareFieldFormat{usera}{\hindexformat{#1}}
\DeclareFieldFormat{userb}{\accrateformat{#1}}
\DeclareFieldFormat{userc}{\accmetaformat{#1}}
\DeclareFieldFormat{userd}{\pdfformat{#1}}
\DeclareFieldFormat{usere}{\githubformat{#1}}
\DeclareFieldFormat{userf}{\videoformat{#1}}
\DeclareFieldFormat{userg}{\noteformat{#1}}

%% Place customized fields at the end of an item

\AtEveryBibitem{%
    \csappto{blx@bbx@\thefield{entrytype}}{%
        \iffieldundef{usera}{}{\space\printfield{usera}}%
        \iffieldundef{userb}{}{\space\printfield{userb}}%
        \iffieldundef{userc}{}{\space\printfield{userc}}%
        \iffieldundef{userd}{}{\space\printfield{userd}}%
        \iffieldundef{usere}{}{\space\printfield{usere}}%
        \iffieldundef{userf}{}{\space\printfield{userf}}
        \iffieldundef{userg}{}{\space\printfield{userg}}
    }
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% References
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newenvironment{references}{
    \section{References}
    % \multicolsep0pt
    \begin{multicols}{2}}{
    \end{multicols}}

\newcommand{\reference}[4]{
    \begin{tabular}{l}
        \textbf{#1} \\
        \textit{#2} \\
        {#3} \\
        \formatemail{#4} \\
    \end{tabular}}