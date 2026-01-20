
mkdir -p ./output

typst compile --root . atexts.typ ./output/atexts.pdf --no-pdf-tags
typst compile --root . cal1t/cal1t.typ ./output/cal1t.pdf --no-pdf-tags
typst compile --root . cal2t/cal2t.typ ./output/cal2t.pdf --no-pdf-tags
