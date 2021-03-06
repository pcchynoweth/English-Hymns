%{
The music and poetry produced by this source code are believed to be in the public domain in the United States.
The source code itself is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License:
http://creativecommons.org/licenses/by-nc/4.0/

Musicam Ecclesiae - sites.google.com/site/musicamecclesiae
%}

\version  "2.18.0-1"
\include "english.ly"
\include "hymnstyle.ly"


ital = {
  \override Lyrics.LyricText #'font-shape = #'italic
}

italOff = {
  \revert Lyrics.LyricText #'font-shape
}

\header {
   poet = \markup{ \fontsize #4 \smallCaps "Be Joyful, Mary, Heavenly Queen"  }
    meter = \markup { \small { Music: REGINA CAELI, JUBILA, 8.5.8.4.7; \italic "Leisentritt's Gesangbuch," 1584; harm. various} }
    piece = \markup { \small {Text: adapted from \italic "Regina Caeli," anon., \italic "Psallite," 1901 }}
    %breakbefore
    %copyright = ""
    tagline = ""
}

global = {
	\key f \major
	\time 4/4
	%\autoBeamOff
	\set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
	\global
	\partial 4
	f4 |
	f c' a f |
	g g a c |
	bf a g2 |
	f2. \bar "||" \break
		bf4 |
	bf bf a g |
	a b c\fermata \bar "||" \break
		 bf4 |
	a g f c' |
	d c bf a |
	g2 f4 \bar "|."
}

alto = \relative c' {
	\global
	\partial 4
	c4 |
	d c c f |
	f e f f |
	f f f( e) |
	f2. f4 |
	g e f e |
	f f e d8[ e] |
	f4 e f f |
	f f d8[ e] f4 |
	f( e) c
}

tenor = \relative c' {
	\global
	\partial 4	
	a4 |
	a g f a |
	d c c c |
	d c c2 |
	a2. 
	
	  bf4 |
	d c c c |
	c d g, bf! |
	c4. bf8 a4 c |
	bf a bf c |
	d( c8[ bf]) a4
}

bass = \relative c {
	\global
	\partial 4
	f4 |
	d e f d |
	bf c f, a |
	bf f c'2 |
	f2. d4 |
	e g f c |
	f d c\fermata g |
	a8[ bf] c4 f a, |
	bf f' g f |
	bf,( c) f4
}

verseOne = \lyricmode {
	\set stanza = "1."
	Be joy -- ful, Ma -- ry, heav'n -- ly Queen,
	\ital Gau -- de, Ma -- rí -- a!  \italOff
	Now let thine eyes with glad -- ness beam.
	\ital Al -- le -- lú -- ia!
	Lae -- tá -- re, O Ma -- rí -- a!
}

verseTwo = \lyricmode {
	\set stanza = "2."
	Whom thou didst bear by heav -- en's grace,
	\ital Gau -- de, Ma -- rí -- a!  \italOff
	Did all our guilt and sin ef -- face.
	\ital Al -- le -- lú -- ia!
	Lae -- tá -- re, O Ma -- rí -- a!
}

verseThree = \lyricmode {
	\set stanza = "3."
	The Lord has ris -- en from the dead,
	\ital Gau -- de, Ma -- rí -- a!  \italOff
	He rose with might, as He had said.
	\ital Al -- le -- lú -- ia!
	Lae -- tá -- re, O Ma -- rí -- a!
}

verseFour = \lyricmode {
	\set stanza = "4."
	O pray to God, thou Vir -- gin fair,
	\ital Gau -- de, Ma -- rí -- a!  \italOff	
	That He our souls to heav -- en bear.
	\ital Al -- le -- lú -- ia!
	Lae -- tá -- re, O Ma -- rí -- a!
}



\score {
  \context ChoirStaff <<
    \context Staff = upper <<
      \context Voice =
         sopranos { \voiceOne << \melody >> }
      \context Voice =
         altos { \voiceTwo << \alto >> }
      \context Lyrics = one \lyricsto sopranos \verseOne
	  \context Lyrics = two \lyricsto sopranos \verseTwo
	  \context Lyrics = three \lyricsto sopranos \verseThree
	  \context Lyrics = four \lyricsto sopranos \verseFour

    >>
    \context Staff = lower <<
      \clef bass
      \context Voice =
        tenors { \voiceOne << \tenor >> }
      \context Voice =
        basses { \voiceTwo << \bass >> }
    >>
  >>
\midi { 
   \context {
       \Score 
       tempoWholesPerMinute = #(ly:make-moment 84 4)
            }
       }

	\layout {}
}
