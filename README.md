# LaTeX Template

My general purpose LaTeX template.

## Bibliography

The bibliography is input from `main-lit.tex` if it exists. Otherwise it will
check for a `literature.bib` either in the same folder or in
`$TEXMFHOME/bibtex/bib/`. To generate the `main-lit.tex`, run `make bib`.

## Compiling

You can use `make` or call `latexmk` directly to compile. If you use a decent
editor or LaTeX IDE this should work without problems.

## Continuous Integration

After each commit, the paper is build with GitHub Actions and a PDF is uploaded
to the workflow tab. By default it will clone [my bibliography][bibliography]
and use that.  If you want to change this behaviour, change or remove that step
from the [workflow configuration](.github/workflows/compile.yaml) or add your
own bibliography as `literature.bib`.

Every commit that is tagged matching `v*.*.*` (e.g. `v1.0.3b`), will create a
release with the PDF as release artifact.

[bibliography]: https://github.com/NicolaiRuckel/bibliography
