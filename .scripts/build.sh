
VERSION=$(if [ $# -ge 1 ]; then echo "$1"; else echo ""; fi)
OUTPUT=$(if [ "$VERSION" = "" ]; then echo "output"; else echo "release"; fi)
SUFFIX=$(if [ "$VERSION" = "" ]; then echo ""; else echo "-$VERSION"; fi)

mkdir -p $OUTPUT

typst compile --root . typst/atexts.typ $OUTPUT/atexts$SUFFIX.pdf --no-pdf-tags
typst compile --root . typst/cal1t.typ $OUTPUT/cal1t$SUFFIX.pdf --no-pdf-tags
typst compile --root . typst/cal2t.typ $OUTPUT/cal2t$SUFFIX.pdf --no-pdf-tags
typst compile --root . typst/lin1t.typ $OUTPUT/lin1t$SUFFIX.pdf --no-pdf-tags
typst compile --root . typst/cal3t.typ $OUTPUT/cal3t$SUFFIX.pdf --no-pdf-tags
