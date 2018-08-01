.PHONY: clean astyle evince all

default: all

PDFLATEX_TAGS :=

PDF_FILE := rapport

BIB_FILE := $(wildcard *.bib)

TEX_FILE := $(wildcard *.tex)
FIG_FILES := $(wildcard figures/fig*.pdf)
BIB_FILES := $(wildcard *.bib)
SUB_TEX_FILES := $(wildcard includes/*.tex)

AUX_FILES := $(filter-out $(TEX_FILE) $(FIG_FILES) $(BIB_FILES) ,$(wildcard *.*))
SUB_AUX_FILES := $(filter-out $(SUB_TEX_FILES) ,$(wildcard includes/*.*))

all:
	pdflatex $(TEX_FILE)
	bibtex $(PDF_FILE)
	pdflatex $(TEX_FILE)
	pdflatex $(TEX_FILE)

ASTYLE_OPTIONS := --style=attach --indent=spaces=2

astyle:
	astyle $(TEX_FILE) $(SUB_TEX_FILES)

evince: all
	evince $(PDF_FILE).pdf

clean:
	rm -r $(AUX_FILES) $(SUB_AUX_FILES)
