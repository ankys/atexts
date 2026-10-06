
VERSION=$(if [ $# -ge 1 ]; then echo "$1"; else echo ""; fi)
SUFFIX=$(if [ "$VERSION" = "" ]; then echo ""; else echo "-$VERSION"; fi)

mkdir -p output

typst compile --root . typst/atexts.typ output/atexts$SUFFIX.pdf --no-pdf-tags
typst compile --root . typst/cal1t.typ output/cal1t$SUFFIX.pdf --no-pdf-tags
typst compile --root . typst/cal2t.typ output/cal2t$SUFFIX.pdf --no-pdf-tags
typst compile --root . typst/lin1t.typ output/lin1t$SUFFIX.pdf --no-pdf-tags
typst compile --root . typst/cal3t.typ output/cal3t$SUFFIX.pdf --no-pdf-tags
