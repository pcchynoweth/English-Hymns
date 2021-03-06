%{
The music and poetry produced by this source code are believed to be in the public domain in the United States.
The source code itself is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License:
http://creativecommons.org/licenses/by-nc/4.0/

Musicam Ecclesiae - sites.google.com/site/musicamecclesiae
%}

\version  "2.18.0-1"
\include "english.ly"
\include "hymnstyle.ly"

\header {
  poet = \markup{ \fontsize #4 \smallCaps "Bread of Heaven, On Thee We Feed"  }
  meter = \markup { \small { Music: BREAD OF HEAVEN, 77.77.77.; W.D. Maclagan, 1875 } }
  piece = \markup { \small {Text: J. Conder, 1824, alt. to plural }}
  %breakbefore
  %copyright = ""
  tagline = ""
}


global = {
  \key d \major
  \time 4/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
  \global
  a4 g8[ fs] e4 e |
  d e fs2 |
  g4 a g fs |
  fs e e2 \bar "||"

  a4 g8[ fs] e4 e |
  d e fs2 |
  gs4 a b a |
  a gs a2 \bar "||"

  d4 cs8[ b] a4 fs |
  g a b2 |
  a4 d, g fs |
  fs e d2 \bar "|."
}

alto = \relative c' {
  \global
  d4 cs8[ d] cs4 cs |
  d cs d2 |
  e4 e d d |
  d d cs2 |

  d4 cs8[ d] cs4 cs |
  d cs d2 |
  d4 cs b bs |
  cs d cs2 |

  d4 g fs d |
  d d d2 |
  d4 d cs d |
  cs cs d2
}

tenor = \relative c' {
  \global
  a4 a a g |
  fs a a2 |
  a4 a b a |
  a gs a2 |

  a4 a a g |
  fs a a2 |
  e4 e fs fs |
  a b a2 |

  fs4 e a a |
  b fs g2 |
  a4 a a a |
  a g fs2
}

bass = \relative c {
  \global
  fs4 e8[ d] a4 a |
  b a d2 |
  cs4 cs d d |
  b b a2 |

  fs'4 e8[ d] a4 a |
  b a d2 |
  b4 a d ds |
  e e a,2 |

  b4 cs d c |
  b a g2 |
  fs4 fs' e d |
  a a d2
}

verseOne = \lyricmode {
  \set stanza = "1."
  Bread of heav'n, on Thee we feed,
  For Thy Flesh is meat in -- deed;
  Ev -- er may our souls be fed
  With this true and liv -- ing Bread,
  Day by day with strength sup -- plied
  Through the life of Him who died.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  Vine of heav'n, Thy Blood sup -- plies
  This blest cup of sac -- ri -- fice;
  'Tis Thy wouds our heal -- ing give;
  To Thy Cross we look and live:
  Thou our life! O let us be
  Root -- ed, graft -- ed, built on Thee.
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

