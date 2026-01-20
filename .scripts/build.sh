
VERSION=$(if [ $# -ge 1 ]; then echo "$1"; else echo ""; fi)
SUFFIX=$(if [ "$VERSION" = "" ]; then echo ""; else echo "-$VERSION"; fi)

mkdir -p output

typst compile --root . atexts.typ output/atexts$SUFFIX.pdf --no-pdf-tags
typst compile --root . cal1t/cal1t.typ output/cal1t$SUFFIX.pdf --no-pdf-tags
typst compile --root . cal2t/cal2t.typ output/cal2t$SUFFIX.pdf --no-pdf-tags
