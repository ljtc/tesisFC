\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{tesisFC}[2021/02/23 v0]

\LoadClassWithOptions{memoir}

%Opciones para la clase
\newif\ifisimp
\DeclareOption{imp}{\isimptrue}
\ProcessOptions\relax

%Geometría
\ifisimp
\setstocksize{279mm}{216mm}
\settrimmedsize{224mm}{170mm}{*}
\settypeblocksize{*}{130mm}{1.3}
\setulmargins{30mm}{*}{*}
\setlrmargins{*}{*}{2}
\setmarginnotes{17pt}{86pt}{\onelineskip}
\setheadfoot{\onelineskip}{2\onelineskip}
\setheaderspaces{*}{2\onelineskip}{*}
\checkandfixthelayout
\else
\settypeblocksize{7.75in}{33pc}{*}
\setulmargins{4cm}{*}{*}
\setlrmargins{1.25in}{*}{*}
\setmarginnotes{17pt}{86pt}{\onelineskip}
\setheadfoot{\onelineskip}{2\onelineskip}
\setheaderspaces{*}{2\onelineskip}{*}
\checkandfixthelayout
\fi


\RequirePackage{mathtools}
\RequirePackage{amsthm}
\RequirePackage{siunitx}


%Revisar el tipo de compilación para cargar paquetes y fuentes
\ifluatex
  \RequirePackage{fontspec}
  \RequirePackage{unicode-math}
  \RequirePackage[tracking=true,protrusion=true]{microtype}
  \RequirePackage{polyglossia}
  \setdefaultlanguage[spanishoperators=all]{spanish}
  \PolyglossiaSetup{spanish}{indentfirst=false}
  \setmainfont{STIX Two Text}
  \setmathfont{STIX Two Math}
\fi

\ifpdftex
    \RequirePackage[T1]{fontenc}
    \RequirePackage[utf8]{inputenc}
    \RequirePackage[spanish,mexico,es-noshorthands,shorthands=off]{babel}
    \RequirePackage{stix2}
    \RequirePackage[tracking=true,spacing=true,kerning=true,protrusion=true]{microtype}
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
