MSCS_2024 = science_atlantic_mscs_2024
AUPAC_2025 = science_atlantic_aupac_2025
MSCS_2025 = science_atlantic_mscs_2025

AUX_EXTS = aux log nav out snm toc

.PHONY: all aupac mscs24 mscs25 clean

all: aupac mscs24 mscs25

aupac:
	cd "$(AUPAC_2025)" && lualatex main.tex && lualatex main.tex
	@for ext in $(AUX_EXTS); do rm -f "$(AUPAC_2025)"/*.$$ext; done

mscs24:
	cd "$(MSCS_2024)" && pdflatex main.tex && pdflatex main.tex
	@for ext in $(AUX_EXTS); do rm -f "$(MSCS_2024)"/*.$$ext; done

mscs25:
	cd "$(MSCS_2025)" && lualatex main.tex && lualatex main.tex
	@for ext in $(AUX_EXTS); do rm -f "$(MSCS_2025)"/*.$$ext; done

clean:
	@for ext in $(AUX_EXTS) pdf; do \
		rm -f "$(AUPAC_2025)"/*.$$ext "$(MSCS_2024)"/*.$$ext "$(MSCS_2025)"/*.$$ext; \
	done
