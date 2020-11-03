STATE		:= California
SPACE		:= $() $()
STATE_NOSPACE	:= $(subst $(SPACE),_,$(STATE))
REPORT		:= Analysis_$(STATE_NOSPACE).html
OUTPUT		:= output
REPORT_PATH	:= $(OUTPUT)/$(REPORT)
R_FUNCTIONS	:= $(wildcard code/functions/*.R)
MOBILITY_DATA	:= data/raw_data/applemobilitytrends-2020-09-17.csv
SEQ_DATA	:= /blast-db/sars-cov-2-seq-data/2020-10-15_ncbi_sars_cov_2_sequences.fasta.gz
SEQ_SUMMARY	:= $(OUTPUT)/analyze_covid_blast-db.txt

all: $(REPORT_PATH)

$(REPORT_PATH): Analysis.Rmd references.bib $(R_FUNCTIONS) $(SEQ_SUMMARY) $(MOBILITY_DATA) run_analyze_covid_pipeline.sh
	bash run_analyze_covid_pipeline.sh "$(STATE)" "$(MOBILITY_DATA)" "$(SEQ_SUMMARY)"

$(SEQ_SUMMARY): code/process_sequences.sh $(SEQ_DATA)
	bash code/process_sequences.sh "$(SEQ_DATA)" > "$(SEQ_SUMMARY)"

clean: 
	rm -fv output/*.html
	rm -fv Analysis.html
	rm -fv output/*summary.txt
	rm -fv output/*/*.csv
	rm -fv output/*/*.png
	rm -fv output/*/*/*.png

.PHONY: all clean
