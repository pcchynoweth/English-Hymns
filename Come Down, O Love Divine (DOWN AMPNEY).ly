%{
The music and poetry produced by this source code are believed to be in the public domain in the United States.
The source code itself is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License:
http://creativecommons.org/licenses/by-nc/4.0/

Musicam Ecclesiae - sites.google.com/site/musicamecclesiae
%}

\version  "2.18.0-1"
\include "english.ly"
\include "hymnstyle.ly"

breathmark = {
  \override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible
  \override Score.RehearsalMark #'Y-offset = #'4.0
  \override Score.RehearsalMark #'X-offset = #'-0.5
  \mark \markup { \fontsize #4 ","}
}

\paper {
  #(set-paper-size "ustrade")
}

\header {
  poet = \markup{ \fontsize #4 \smallCaps "Come Down, O Love Divine"  }
  meter = \markup { \small { Music: DOWN AMPNEY, 6.6.11. D.; R.Vaughan Williams, \italic "The English Hymnal," 1906} }
  piece = \markup { \small {Text: \italic "Discendi, Amor santo," Bianco da Siena, (d. 1434); tr. R.F. Littledale, 1867}}
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

melody = \relative c' {
  \global
  d2 e4 fs |
  a2 b |
  a1 \bar "||"

  a2 b4 a |
  d( cs) b2 |
  a2 \breathmark \bar "||" \break

  a2 |
  b4 a g fs |
  e d e fs8[ g] |
  e2 d^\fermata \bar "||" \break

  d'2 cs4 b |
  a2 b |
  a1 \bar "||"

  c2 b4 a |
  g2 fs |
  e^\fermata \bar "||" \break

  e2 |
  a4 b a g |
  fs d e fs8[ g] |
  e2 d^\fermata \bar "|."
}

alto = \relative c' {
  \global
  a2 a4 d |
  d( cs) b( cs) |
  d1 \bar "||"

  fs2 fs4 e |
  d( e) d2 |
  cs \bar "||"

  d2 |
  d4 cs d d |
  b d d d |
  d( cs) d2 \bar "||"

  fs2 fs4 d |
  fs2 e4( d) |
  cs1 \bar "||"

  e2 d4 d |
  b( cs) d2 |
  a2 \bar "||"

  cs |
  d4 d cs d8[ e] |
  a,4 d d d |
  d( cs) d2 \bar "|."
}

tenor = \relative c {
  \global
  fs2 a4 d, |
  e2 g4( e) |
  fs1 |
  a2 d,4 e |
  fs( a) a( gs) |
  a2 \bar "||"

  fs2 |
  g4 e g a |
  g a b b |
  a4.( g8) fs2 \bar "||"

  b2 a4 b |
  d( cs) b2 |
  cs1 \bar "||"

  g4( a) b fs |
  g2 a4( b) |
  cs2 \bar "||"

  a2 |
  a4 g e b' |
  a a b g |
  a4.( g8) fs2 \bar "|."
}

bass = \relative c {
  \global
  d2 cs4 d |
  a2 g |
  d'1 \bar "||"

  d2 d4 cs |
  b( cs) e2 |
  a,2 \bar "||"

  d2 |
  g,4 a b d |
  g fs g e |
  a,2 d_\fermata \bar "||"

  b' fs4 g |
  d( fs) gs2 |
  a1 \bar "||"

  e4( fs) g d |
  e2 fs4( g) |
  a2_\fermata \bar "||"

  a,4( g) |
  fs g a d8[ cs] |
  d4 fs g e |
  a,2 d_\fermata \bar "|."
}

verseOne = \lyricmode {
  \set stanza = "1."
  Come down, O Love di -- vine,
  Seek thou this soul of mine,
  And vi -- sit it with thine own ar -- dour glow -- ing;
  O Com -- for -- ter, draw near,
  With -- in my heart ap -- pear,
  And kin -- dle it, thy ho -- ly flame be -- stow -- ing.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  O let it free -- ly burn,
  Till earth -- ly pas -- sions turn
  To dust and ash -- es in its heat con -- sum -- ing;
  And let thy glo -- rious light
  Shine ev -- er on my sight,
  And clothe me round, the while my path il -- lum -- ing.
}

verseThree = \lyricmode {
  \set stanza = "3."
  Let ho -- ly cha -- ri -- ty
  Mine out -- ward ves -- ture be,
  And low -- li -- ness be -- come mine in -- ner cloth -- ing;
  True low -- li -- ness of heart,
  Which takes the humb -- ler part,
  And o'er its own short -- com -- ings weeps with loath -- ing.
}

verseFour = \lyricmode {
  \set stanza = "4."
  And so the yearn -- ing strong,
  With which the soul will long,
  Shall far out -- pass the pow'r of hu -- man tel -- ling;
  For none can guess its grace,
  Till he be -- come the place
  Where -- in the Ho -- ly Spi -- rit makes his dwel -- ling.
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
      tempoWholesPerMinute = #(ly:make-moment 88 4)
    }
  }
  \layout { }
}
