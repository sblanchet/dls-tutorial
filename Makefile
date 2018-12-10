
# Makefile for dls-tutorial.pdf

all: dls-tutorial.pdf

dls-tutorial.pdf: main.ps
	ps2pdf $< $@

main.ps : main.dvi
	dvips $< -o $@


LATEX_CMD:=latex -halt-on-error -interaction=nonstopmode
main.dvi: genpicts document_version.tex
# compile 3 times for longtables
	$(LATEX_CMD) main.tex
	$(LATEX_CMD) main.tex
	$(LATEX_CMD) main.tex


genpicts:
	mkdir -p genpicts
#	\cp -f picts/*.eps genpicts/
#	for f in  picts/*.jpg ; do convert $$f  genpicts/`basename $$f .jpg`.eps ; done
	for f in  picts/*.png ; do convert $$f  genpicts/`basename $$f .png`.eps ; done
#	for f in  picts/*.gif ; do convert $$f  genpicts/`basename $$f .gif`.eps ; done
#	for f in  picts/*.pdf ; do \
            pdf2ps  $$f  genpicts/`basename $$f .pdf`.ps ; \
            ps2epsi genpicts/`basename $$f .pdf`.ps  genpicts/`basename $$f .pdf`.eps  ; \
	done



# Get date of the last commit
COMMIT_LAST_DATE  := $(shell git log --max-count=1 --format=%cd --date=format:'%B %d, %Y' ./ )
document_version.tex:
	echo "% AUTOMATICALLY GENERATED FILE - DO NOT EDIT" > $@
	echo '\\newcommand{\\builddate}{'"${COMMIT_LAST_DATE}"'}' >> $@



# Preview README.md without uploading to github
README.html : README.md
	pandoc -t html $^ > $@



# cleaning

veryclean: clean
	rm -f *.pdf *.ps *~

clean:
	rm -f *.aux *.log *.out *.olg *.ind *.dvi *.idx *.toc *~
	rm -fr genpicts



# PHONY dependencies. These dependencies are always executed
.PHONY :  all clean veryclean genpicts dvi document_version.tex
