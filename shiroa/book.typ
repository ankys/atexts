
#import "@preview/shiroa:0.4.0": *

#show: book

#book-meta(
  title: "数学テキスト",
  authors: ("中安淳",),
  language: "ja",
  summary: [
- #prefix-chapter("src/00_preface.typ")[序文]
= 微分積分学１
// - #chapter("src/cal1t/00_preface.typ")[序文]
// - #chapter("src/cal1t/01_set.typ")[集合]
// - #chapter("src/cal1t/02_number.typ")[数]
// - #chapter("src/cal1t/03_infsup.typ")[極値]
// - #chapter("src/cal1t/04_sequence.typ")[数列]
// - #chapter("src/cal1t/05_limit.typ")[極限]
// - #chapter("src/cal1t/06_functions.typ")[種々の関数]
// - #chapter("src/cal1t/07_equidist.typ")[一様分布論]
  ]
)

#import "/deps/theorem.typ": show-theorem

#let book-page(title: none, body) = {
  import "@preview/shiroa-starlight:0.4.0": starlight
  show: starlight.with(
    include "./book.typ",
    title: title,
  )
  show: show-theorem
  set text(lang: "ja")
  body
}
