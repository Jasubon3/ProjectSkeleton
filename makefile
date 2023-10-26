PHONY: clean

clean:
	rm -f Figures
	mkdir Figures

	
Rplot.png: Scratch.R IndianWeatherRepository.csv
	Rscript Scratch.R
Clustered_PCA.png: Scratch.R IndianWeatherRepository.csv
	Rscript Scratch.R
Temp_Variation.png: Scratch.R IndianWeatherRepository.csv
	Rscript Scratch.R
Weather_condition.png: Scratch.R IndianWeatherRepository.csv
	Rscript Scratch.R
PCA.png: Scratch.R IndianWeatherRepository.csv
	Rscript Scratch.R