
#import "@preview/shiroa:0.4.0": x-current

#let path = x-current
#import path: title

#import "/shiroa/book.typ": book-page
#show: book-page.with(title: title)

#include path
