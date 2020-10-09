SHELL := bash
.ONESHELL:
.SHELLFLAGS := -eu -o pipefail -c
.DELETE_ON_ERROR:
MAKEFLAGS += --warn-undefined-variables
MAKEFLAGS += --no-builtin-rules

SOURCES=$(wildcard *.tex)
IMAGES=$(wildcard images/**)

JOBNAME=main

all: out/$(JOBNAME).pdf


out/$(JOBNAME).pdf: $(SOURCES) $(IMAGES) bib
	latexmk -jobname=$(JOBNAME)

bib:
	./scripts/format_bib.sh --file bibliography.bib

clean:
	latexmk -C

.PHONY: all clean bib
