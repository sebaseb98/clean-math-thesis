// local imports
#import "../meta.typ": author, city, deadline
#set page(
  numbering: none,
  header: none,
) // turn off the header for the declaration

#heading(level: 2, outlined: false, numbering: none)[Declaration]

Typically, you need to declare that e.g. you wrote everything on your own. This university dependent statement is usually required to be signed by the author.
#v(1cm)
#align(left)[#city, #deadline]
#align(right)[
#line(length: 40%)
 #author
]