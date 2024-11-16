// global
#import "../lib.typ": template

//local
#import "customization/colors.typ": *


#show: template.with(
  // personal/subject related stuff
  author: "Stuart Dent",
  title: "My Very Fancy and Good-Looking Thesis About Interesting Stuff",
  supervisor1: "Prof. Dr. Sue Persmart",
  supervisor2: "Prof. Dr. Ian Telligent",
  degree: "Example",
  program: "Example-Studies",
  university: "Example University",
  institute: "Example Institute",
  deadline: datetime.today().display(),

  // file paths for logos etc.
  uni-logo: image("images/logo_placeholder.svg", width: 50%),
  institute-logo: image("images/logo_placeholder.svg", width: 50%),

  // formatting settings
  body-font: "Libertinus Serif",
  cover-font: "Libertinus Serif",

  // chapters that need special placement
  abstract: include "chapter/abstract.typ",

  // equation settings
  equate-settings: (breakable: true, sub-numbering: true, number-mode: "label"),

  // colors
  colors: (cover-color: color1, heading-color: color2),
)

// ------------------- content -------------------
#include "chapter/introduction.typ"
#pagebreak()
#include "chapter/dummy_chapter.typ"
#pagebreak()
#include "chapter/conclusions_outlook.typ"
#pagebreak()
#include "chapter/appendix.typ"
#pagebreak()

// ------------------- bibliography -------------------
#bibliography("References.bib")
#pagebreak()

// ------------------- declaration -------------------
#include "chapter/declaration.typ"