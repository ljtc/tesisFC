\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{tesisFC}[2021/02/23 v1]

\LoadClassWithOptions{memoir}

%Opciones para la clase
\newif\ifisimp
\DeclareOption{imp}{\isimptrue}
\ProcessOptions\relax

%Geometría
\ifisimp
\setstocksize{279mm}{216mm}
\settrimmedsize{224mm}{170mm}{*}
\settypeblocksize{142mm}{125mm}{*}
\setulmargins{44mm}{*}{*}
\setlrmargins{*}{*}{1.7}
\setmarginnotes{17pt}{86pt}{\onelineskip}
\setheadfoot{\onelineskip}{2\onelineskip}
\setheaderspaces{*}{2\onelineskip}{*}
\checkandfixthelayout
\else
\settypeblocksize{196.85mm}{33pc}{*}
\setulmargins{4cm}{*}{*}
\setlrmargins{31.75mm}{*}{*}
\setmarginnotes{17pt}{86pt}{\onelineskip}
\setheadfoot{\onelineskip}{2\onelineskip}
\setheaderspaces{*}{2\onelineskip}{*}
\checkandfixthelayout
\fi


\RequirePackage{mathtools}
\RequirePackage[predefined={parent=chapter}]{keytheorems}
\RequirePackage{siunitx}
\RequirePackage{multicol}



%Revisar el tipo de compilación para cargar paquetes y fuentes
\ifluatex
  \RequirePackage{fontspec}
  \RequirePackage{unicode-math}
  \RequirePackage[spanish,mexico,es-noindentfirst]{babel}
  \RequirePackage[tracking=true,protrusion=true]{microtype}
  \setmainfont{STIX Two Text}
  \setmathfont{STIX Two Math}
\fi

\ifpdftex
  \RequirePackage[T1]{fontenc}
  \RequirePackage[spanish,mexico,es-noindentfirst]{babel}
  \RequirePackage{stix2}
  \RequirePackage[tracking=true,spacing=true,kerning=true,protrusion=true]{microtype}
\fi

%Sin figuras en el margen con la oción para imprimir
\ifisimp
\renewenvironment{marginfigure}{\begin{figure}}{\end{figure}}
\fi


%Estilo de capítulos
\chapterstyle{madsen}
\setlength\beforechapskip{-\baselineskip}

%Cabeceras y pies
\nouppercaseheads%
\makepagestyle{tesisFC}
\makeevenhead{tesisFC}{}{}{\leftmark}
\makeoddhead{tesisFC}{\rightmark}{}{}
\makeevenfoot{tesisFC}{}{}{\thepage}
\makeoddfoot{tesisFC}{\thepage}{}{}
\makeheadrule{tesisFC}{\linewidth}{0.4pt}
\pagestyle{tesisFC}

%Portada
\RequirePackage{graphicx}
\RequirePackage{xstring}

%newtoks
\newtoks\grado
\newtoks\tipo
\newtoks\tutor
\newtoks\tutorW

%tamaño de fuentes para la portada
\ifisimp
  \newcommand{\escudos}[1]{\fontsize{4pt}{6pt}\fontshape{sc}\selectfont #1}
  \newcommand{\unamfc}[1]{\fontsize{10}{12}\fontshape{sc}\selectfont #1}
  \newcommand{\titulos}[1]{\fontsize{20}{22}\fontshape{sc}\selectfont #1}
  \newcommand{\trabajo}[1]{\fontsize{9}{11}\fontshape{sc}\selectfont #1}
\else
  \newcommand{\escudos}[1]{\fontsize{5pt}{7pt}\fontshape{sc}\selectfont #1}
  \newcommand{\unamfc}[1]{\fontsize{12}{14}\fontshape{sc}\selectfont #1}
  \newcommand{\titulos}[1]{\fontsize{25}{27}\fontshape{sc}\selectfont #1}
  \newcommand{\trabajo}[1]{\fontsize{10}{12}\fontshape{sc}\selectfont #1}
\fi

%Modificación del código proporcionado por la facultad hace algunos años
\ifisimp
\newcommand*{\portadatesis}{%
\begin{titlingpage}
\noindent
\begin{minipage}[c][0.99\textheight][c]{0.2\textwidth}%
  \noindent\begin{minipage}[t][0.15\textheight][c]{\textwidth}
    \begin{center}
    \includegraphics[height=2.2cm]{unam}
    \end{center}
  \end{minipage}%
  \\
  \noindent\begin{minipage}[c][0.66\textheight][c]{\textwidth}
    \begin{center}
    \vrule width1pt height0.63\textheight
    \hskip3mm
    \vrule width2pt height0.63\textheight
    \hskip3mm
    \vrule width1pt height0.63\textheight
    \end{center}
  \end{minipage}%
  \\[3mm]
  \noindent\begin{minipage}[b][0.15\textheight][c]{\textwidth}
    \begin{center}
    \includegraphics[height=2.2cm]{fc}\par
    {\escudos Facultad de Ciencias} \par
    \vspace{-2mm}
    {\escudos unam}
    \end{center}
  \end{minipage}%
\end{minipage}
\hfill%
\begin{minipage}[c][0.99\textheight][t]{0.744\textwidth}
  \begin{center}
  \vspace{2mm}
  {\unamfc Universidad Nacional Aut\'onoma de M\'exico\par}
  \vspace{5mm}
  \hrule height2pt
  \vspace{3mm}
  \hrule height1pt
  \vspace{5mm}
  {\unamfc Facultad de Ciencias\unskip\strut\par}
  \vspace{12mm}
  {\unamfc\thetitle\par}
  \vspace{12mm}
  \begin{minipage}{8cm}
    \centering
    \IfSubStr{\the\tipo}{esis}{\makebox[8cm][s]{\titulos T E S I S}}%
    {\titulos\MakeTextUppercase{\the\tipo}}
  \end{minipage}\\[1cm]
  \makebox[7cm][c]{\trabajo{QUE PARA OBTENER EL T\'ITULO DE:}}\\[7.5mm]
  {\trabajo{\the\grado}}\\[9.5mm]
  \makebox[7cm][s]{\trabajo{P R E S E N T A :}}\\[7.5mm]
  {\trabajo{\theauthor}}\par
  \vspace{9.5mm}
  {\trabajo{\MakeTextUppercase{\the\tutorW}}\\[4.5mm]
  {\trabajo{\the\tutor}}}

  \vfill

  {\scshape\thedate}
  \end{center}
\end{minipage}
\end{titlingpage}
}
\else
\newcommand*{\portadatesis}{%
\begin{titlingpage}
\noindent
\begin{minipage}[c][0.99\textheight][c]{0.2\textwidth}%
  \noindent\begin{minipage}[t][0.15\textheight][c]{\textwidth}
    \begin{center}
    \includegraphics[height=2.718cm]{unam}
    \end{center}
  \end{minipage}%
  \\
  \noindent\begin{minipage}[c][0.66\textheight][c]{\textwidth}
    \begin{center}
    \vrule width1pt height0.632\textheight
    \hskip3mm
    \vrule width2pt height0.632\textheight
    \hskip3mm
    \vrule width1pt height0.632\textheight
    \end{center}
  \end{minipage}%
  \\[3mm]
  \noindent\begin{minipage}[b][0.15\textheight][c]{\textwidth}
    \begin{center}
    \includegraphics[height=2.718cm]{fc}\par
    {\escudos{Facultad de Ciencias}} \par
    \vspace{-2mm}
    {\escudos{unam}}
    \end{center}
  \end{minipage}%
\end{minipage}
\hfill%
\begin{minipage}[c][0.99\textheight][t]{0.744\textwidth}
  \begin{center}
  \vspace{0.7cm}
  {\unamfc{Universidad Nacional Aut\'onoma de M\'exico\par}}
  \vspace{0.75cm}
  \hrule height2pt
  \vspace{.3cm}
  \hrule height1pt
  \vspace{0.75cm}
  {\unamfc{Facultad de Ciencias\unskip\strut\par}}
  \vspace{2.5cm}
  {\unamfc{\thetitle\par}}
  \vspace{2.5cm}
  \begin{minipage}{8cm}
    \centering
    \IfSubStr{\the\tipo}{esis}{\makebox[8cm][s]{\titulos{T E S I S}}}%
    {\titulos{\MakeTextUppercase{\the\tipo}}}
  \end{minipage}\\[1cm]
  \makebox[7cm][c]{QUE PARA OBTENER EL T\'ITULO DE:}\\[0.8cm]
  {\scshape\the\grado}\\[1cm]
  \makebox[7cm][s]{P R E S E N T A :}\\[0.8cm]
  {\scshape\theauthor}\par
  \vspace{1cm}
  {\MakeTextUppercase{\the\tutorW}\\[0.5cm]
  {\scshape\the\tutor}}
  \vfill
  {\scshape\thedate}
  \end{center}
\end{minipage}
\end{titlingpage}
}
\fi

