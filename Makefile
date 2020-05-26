SHELL := bash
.ONESHELL:
.SHELLFLAGS := -eu -o pipefail -c
.DELETE_ON_ERROR:
MAKEFLAGS += --warn-undefined-variables
MAKEFLAGS += --no-builtin-rules

LATEXMK=latexmk

SOURCES=$(wildcard *.tex)
OUT=out

MAIN=main
JOBNAME=main

(JOBNAME).pdf: $(SOURCES)
	$(LATEXMK) -jobname=$(JOBNAME)


bib:
	$(LATEXMK) -jobname=$(JOBNAME)
	cp -f $(OUT)/$(JOBNAME).bbl $(MAIN)-lit.tex

clean:
	$(LATEXMK) -C
	rm -rf $(OUT)/*
	rm -f  $(MAIN)-lit.tex

.PHONY: bib clean
