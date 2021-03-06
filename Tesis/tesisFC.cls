\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{tesisFC}[2021/02/23 v0]

\LoadClassWithOptions{memoir}

%Opciones para la clase
\newif\ifisimp
\DeclareOption{imp}{\isimptrue}
\ProcessOptions\relax

\RequirePackage{mathtools}
\RequirePackage{amsthm}
\RequirePackage{siunitx}

%Idioma español
\RequirePackage[spanish,mexico,es-noshorthands,shorthands=off]{babel}


%Revisar el tipo de compilación para cargar paquetes y fuentes
\ifluatex
  \RequirePackage{fontspec}
  \RequirePackage{unicode-math}
  \RequirePackage[babel,tracking=true,protrusion=true]{microtype}
  \setmainfont{STIX Two Text}
  \setmathfont{STIX Two Math}
\else
  \ifpdftex
    \RequirePackage[T1]{fontenc}
    \RequirePackage[utf8]{inputenc}
    \RequirePackage{stix2}
    \RequirePackage[tracking=true,spacing=true,kerning=true,protrusion=true]{microtype}
  \fi
\fi

%Portada
\RequirePackage{graphicx}
\RequirePackage{xstring}

\newtoks\facultad
\newtoks\grado
\newtoks\tipo
\newtoks\tutor
\newtoks\logouni
\newtoks\logofac

%Geometría
\setlrmarginsandblock{1.5in}{*}{1}%espina frente radio
\setulmarginsandblock{1in}{*}{1}%superior inferior radio
\checkandfixthelayout%implementa los cambios

%Modificación del código proporcionado por la facultad hace algunos años
\newcommand*{\portadatesis}{%
\begin{titlingpage}
\noindent
\begin{minipage}[c][0.99\textheight][c]{0.2\textwidth}%
	\noindent\begin{minipage}[t][0.15\textheight][c]{\textwidth}
		\begin{center}
		\includegraphics[height=2.718cm]{\the\logouni}
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
		\includegraphics[height=2.718cm]{\the\logofac}\par
		{\tiny\scshape Facultad de \the\facultad} \par
		\vspace{-2mm}
		{\tiny\scshape unam}
		\end{center}
	\end{minipage}%
\end{minipage}
\hfill%
\begin{minipage}[c][0.99\textheight][t]{0.744\textwidth}
	\begin{center}
	    \vspace{0.7cm}
	    {\large\scshape Universidad Nacional Aut\'onoma de M\'exico\par}
	    \vspace{0.75cm}
	    \hrule height2pt
	    \vspace{.3cm}
	    \hrule height1pt
	    \vspace{0.75cm}
	    {\large\scshape Facultad de \the\facultad\unskip\strut\par}
	    \vspace{2.5cm}
	    {\large\scshape\thetitle\par}
	    \vspace{2.5cm}
	    \begin{minipage}{8cm}
	    \centering
	    \IfSubStr{\the\tipo}{esis}{\makebox[8cm][s]{\huge T E S I S}}{\huge\MakeTextUppercase{\the\tipo}}
	    \end{minipage}\\[1.3cm]
	    \makebox[7cm][c]{QUE PARA OBTENER EL T\'ITULO DE:}\\[0.8cm]
	    {\scshape\the\grado}\\[1.3cm]
	    \makebox[7cm][s]{P R E S E N T A :}\\[0.8cm]
	    {\scshape\theauthor}\par
	    \vspace{1.2cm}
	    { TUTOR\\[0.8cm]
	    {\scshape\the\tutor}}
	    \vfill

	    {\scshape\thedate}
	    \vspace{.1cm}

	\end{center}
\end{minipage}
\end{titlingpage}
}

%Nueva geometría
\twocolumn
\settypeblocksize{7.75in}{33pc}{*}
\setulmargins{4cm}{*}{*}
\setlrmargins{1.25in}{*}{*}
\setmarginnotes{17pt}{86pt}{\onelineskip}
\setheadfoot{\onelineskip}{2\onelineskip}
\setheaderspaces{*}{2\onelineskip}{*}
\checkandfixthelayout
\onecolumn

%Estilo de capítulos
\chapterstyle{madsen}

%Cabeceras y pies
\nouppercaseheads%
\makepagestyle{tesisFC}
\makeevenhead{tesisFC}{}{}{\leftmark}
\makeoddhead{tesisFC}{\rightmark}{}{}
\makeevenfoot{tesisFC}{}{}{\thepage}
\makeoddfoot{tesisFC}{\thepage}{}{}
\makeheadrule{tesisFC}{\linewidth}{0.4pt}
\pagestyle{tesisFC}

%Definiciones, teoremas,...
\theoremstyle{plain}
\newtheorem{teorema}{Teorema}[chapter]
\newtheorem{proposicion}[teorema]{Proposición}
\newtheorem{lema}[teorema]{Lema}
\newtheorem{corolario}[teorema]{Corolario}

\theoremstyle{definition}
\newtheorem{definicion}[teorema]{Definición}
\newtheorem{observación}[teorema]{Observación}

%Ambiente de demostración
\renewenvironment{proof}[1][\proofname] {\par\pushQED{\qed}\normalfont\topsep6\p@\@plus6\p@\relax\trivlist\item[\hskip\labelsep\bfseries#1\@addpunct{.}]\ignorespaces}{\popQED\endtrivlist\@endpefalse}
