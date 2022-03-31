OPR_SYSTEM = $(shell uname -s)

ifeq ($(OPR_SYSTEM), Darwin)
	DOC_VIEWER = open -a Firefox
else
	DOC_VIEWER = firefox
endif

html:
	pandoc main.md \
		--from=markdown+tex_math_single_backslash+raw_tex \
		--to=html \
		--output=html/publications.html \
		--citeproc \
		--pdf-engine=xelatex
	$(DOC_VIEWER) html/publications.html

.PHONY: html
