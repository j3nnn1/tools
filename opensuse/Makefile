ALL: opensuse.pdf

%.pdf: %.tex Makefile
	pdflatex $< &&	pdflatex $< && pdflatex $<

clean:
	  rm -f *.aux	*.bbl	*.blg	*.log	*.out *.nav *.snm *.toc
