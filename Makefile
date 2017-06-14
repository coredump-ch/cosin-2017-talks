LATEXMK=latexmk
LATEXMK_ARGS=-pdf -e '$$pdflatex=q/xelatex --shell-escape %O %S/'

all: what_is_the_spaceapi.pdf spaceapi_in_rust.pdf

what_is_the_spaceapi.pdf: what_is_the_spaceapi.tex what_is_the_spaceapi/slides.tex theme
	${LATEXMK} ${LATEXMK_ARGS} what_is_the_spaceapi.tex

spaceapi_in_rust.pdf: spaceapi_in_rust.tex theme
	${LATEXMK} ${LATEXMK_ARGS} spaceapi_in_rust.tex


theme: mtheme
	cd mtheme && make sty
	cp mtheme/*.sty .

clean:
	latexmk -c
	rm -rf _minted-slides/ *.sty *.snm *.vrb *.nav

PHONY: theme clean
