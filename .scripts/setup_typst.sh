
mkdir -p ~/.local/bin
cd

curl 'https://github.com/typst/typst/releases/download/v0.14.2/typst-x86_64-unknown-linux-musl.tar.xz' -LO
tar xf typst-x86_64-unknown-linux-musl.tar.xz
cp typst-x86_64-unknown-linux-musl/typst ~/.local/bin/
