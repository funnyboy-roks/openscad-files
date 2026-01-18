#!/bin/sh

readme=README.md

cat > $readme <<EOF
# OpenSCAD Files

This is a collection of random things that I've modelled in [OpenSCAD]
for personal use.

[OpenSCAD]: https://openscad.org/

## Development

OpenSCAD may be opened in a window with automatic updates using

\`\`\`sh
openscad --viewall <file.scad>
\`\`\`

## Rendering

\`\`\`sh
openscad <file.scad> -o <file.stl>
\`\`\`

## Contents

> [!NOTE]
>
> This sections is auto generated (ish) and may not be 100% perfect.

EOF

mkdir -p img

for file in $(git ls-files | grep '\.scad$'); do
    echo "Generating from $file"
    header=$(head -n1 "$file")

    echo -e "# \`$file\`\n" >> $readme

    if [[ $header == '// '* ]]; then
        header=${header:3}
        echo "header: $header"
        echo -e "$header\n" >> $readme
    fi

    out_png="img/${file%.scad}.png"
    echo "Generating $out_png"
    openscad --preview png "$file" --imgsize=1024,1024 -o "$out_png" --colorscheme DeepOcean
    git add "$out_png"

    echo -e "![Rendered Image](./$out_png)\n" >> $readme
done

git add $readme
