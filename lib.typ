// global
#import "@preview/great-theorems:0.1.1": *
#import "@preview/hydra:0.5.1": hydra

//local
#import "template/customization/colors.typ": *

#let template(

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
  city: "Example City",

  // file paths for logos etc.
  uni_logo_path: "images/logo_placeholder.svg",
  institute_logo_path: "images/logo_placeholder.svg",

  // formatting settings
  citation-style: "ieee",
  body-font: "Libertinus Serif",
  sans-font: "Libertinus Serif",

  body  // the content of the thesis
) = {
// ------------------- settings -------------------
set heading(numbering: "1.1")  // Heading numbering
set enum(numbering: "(i)") // Enumerated lists
set cite(style: citation-style)  // citation style 

// ------------------- Math equation settings -------------------
// only labeled equations get a number
show math.equation:it => {
  if it.has("label"){
    math.equation(block:true, numbering: "(1)", it)
  } else {
    it
  }
}
show ref: it => {
  let el = it.element
  if el != none and el.func() == math.equation {
    link(el.location(), numbering(
      "(1)",
      counter(math.equation).at(el.location()).at(0) + 1
    ))
  } else {
    it
  }
}
show math.equation: box  // no line breaks in inline math
show: great-theorems-init  // show rules for theorems


// ------------------- Settings for Chapter headings ------------------- 
show heading.where(level: 1): set heading(supplement: [Chapter])
show heading.where(
  level: 1,
): it =>{
  if it.numbering != none{
  block(width: 100%)[

  #line(length: 100%, stroke: 0.6pt + color2)
  #v(0.1cm)
  #set align(left)
  #set text(22pt)
  #text(color2)[Chapter
  #counter(heading).display(
    "1:" + it.numbering
  )]

  #it.body
  #v(-0.5cm)
  #line(length: 100%, stroke: 0.6pt + color2)
]  
  }
  else{
    block(width: 100%)[
      #line(length: 100%, stroke: 0.6pt + color2)
      #v(0.1cm)
      #set align(left)
      #set text(22pt)
      #it.body
      #v(-0.5cm)
      #line(length: 100%, stroke: 0.6pt + color2)
    ]
  }
}
// only valid for abstract and declaration
show heading.where(
  outlined: false,
  level: 2
): it => {
  set align(center)
  set text(18pt)
  it.body
  v(0.5cm, weak: true)
}
// Settings for sub-sub-sub-sections e.g. section 1.1.1.1
show heading.where(
  level: 4
): it => {
  it.body 
  linebreak()
}
// same for level 5 headings
show heading.where(
  level: 5
): it => {
  it.body
  linebreak()
}

// ------------------- other settings -------------------
// Settings for Chapter in the outline
show outline.entry.where(
  level: 1
): it => {
  v(14.75pt, weak: true)
  strong(it)
}

// table label on top and not below the table
show figure.where(
  kind: table
): set figure.caption(position: top)

// ------------------- Cover ------------------- 
v(5mm)
//logos
grid(
  columns: (1fr, 1fr),
  rows: (auto),
  column-gutter: 100pt,
  row-gutter: 7pt,
  grid.cell(
    colspan: 1,
    align: center,
    image(uni_logo_path, width: 50%),
  ),
  grid.cell(
    colspan: 1,
    align: center,
    image(institute_logo_path, width: 50%),
  ),
  grid.cell(
    colspan: 1,
    align: center,
    text(font: sans-font, 1.5em, weight: 700, university)
  ),
  grid.cell(
    colspan: 1,
    align: center,
    text(font: sans-font, 1.5em, weight: 700, institute)
  )
)
v(4.5cm)
//title
line(length: 100%, stroke: color1)
align(center, text(font: sans-font, 3em, weight: 700, title))
line(start: (10%,0pt), length: 80%, stroke: color1)
v(5mm)
//author
align(center, text(font: sans-font, 1.5em, weight: 500, degree + " Thesis by " + author))
//study program
align(center, text(font: sans-font, 1.3em, weight: 100, "Study Programme: " + program))
//date
align(center, text(font: sans-font, 1.3em, weight: 100, deadline))
// supervisors
align(center + bottom, text(font: sans-font, 1.3em, weight: 100, " supervised by" + linebreak() + supervisor1 + linebreak() +  supervisor2))
v(-3mm)
pagebreak()

include "chapter/abstract.typ"

set page(
  numbering: "1",
  number-align: center,
  header: context {
    align(center, emph(hydra(1)))
    v(0.2cm)  
  },
)  // Page numbering after cover & abstract => they have no page number
pagebreak()

// ------------------- Tables of ... ------------------- 

// Table of contents
outline(depth: 3, indent: 1em, fill: line(length: 100%, stroke: (thickness: 1pt, dash: "loosely-dotted")))
pagebreak()

// List of figures
outline(
  title: [List of Figures],
  target: figure.where(kind: image),
  fill: line(length: 100%, stroke: (thickness: 1pt, dash: "loosely-dotted"))
)
pagebreak()


// List of Tables
outline(
  title: [List of Tables],
  target: figure.where(kind: table), 
  fill: line(length: 100%, stroke: (thickness: 1pt, dash: "loosely-dotted"))
)
pagebreak()



// ------------------- Chapters -------------------
body

bibliography("References.bib")
pagebreak()

set page(
  numbering: none,
  header: none,
) // turn off the header for the declaration
include "chapter/declaration.typ"
}