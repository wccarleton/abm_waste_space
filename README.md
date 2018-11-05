# Another Agent-Based Model for Evaluating the Waste Hypothesis
## Overview
This repo contains the NetLogo source code and R data analysis scripts for the study presented in the following paper:

[*Carleton, Costopoulos, and Collard (submitted) "Mobility, spatial heterogeneity, and the adaptiveness of monument building: A test of Dunnell’s waste hypothesis"*](https://osf.io/gd6js/)

### Abstract
Monuments are puzzling from a Darwinian perspective because building them diverts resources from survival and reproduction. In the late 1980s, the well-known American evolutionary archaeologist Robert Dunnell proposed a resolution to the conundrum. He suggested that the wastage involved in the construction of monuments and other forms of cultural elaboration confers an adaptive advantage in highly variable environments. This hypothesis has been used to explain a number of instances of cultural elaboration in the archaeological record, but it has only been evaluated once and the results of that study suggested there are major flaws in the hypothesis. Here, we report a series of experiments in which we used an agent-based model to test the hypothesis while taking into account two factors that there is reason to think could enhance the adaptiveness of waste as a response to increased environmental variability—restricted agent movement and spatial structure in resource availability. We found that waste was strongly selected against in most of the experiments, including all of those in which environmental variability was set to the highest level. Two of the experiments suggested that very restricted mobility can select for waste, but this effect disappeared when environmental variation was increased from moderate to high. Thus, our experiments also suggest that Dunnell’s hypothesis is flawed. In our view, archaeologists should now refrain from using it to interpret instances of cultural elaboration.

## Software
The R scripts and NetLogo source file contained in this repository are intended for replication efforts and to improve the transparency of our research. They are, of course, provided without warranty or technical support. That said, questions about the code can be directed to Chris Carleton at ccarleton@protonmail.com.

### NetLogo
Netlogo is a freely available Java-based program with a purpose-made programming language (i.e., a *Logo*) for defining agent-based models and running simulations.

To make use of the NetLogo source file, first download the latest version of [NetLogo](https://ccl.northwestern.edu/netlogo/download.shtml).

### R
There are several R scripts that were used for data analysis in our study. To make use of them, first download the latest version of [R](https://www.r-project.org/). Then, run the NetLogo ABM with the export option in the interface turned on. Once a simulation of the model completes, an R data file (with the extension .RData) will be stored in a folder of your choosing (again, an option in the NetLogo interface for the model). Change the path arguments in the R scripts to match your system—--in particular, change the path arguments in the ts_summaries.R script to the path ending in the folder containing the NetLogo .RData file(s). Then, open R, change to the appropriate working directory, and run:

```
library(fitdistrplus)
source("/PATH/TO/MLEFits.R")
source("/PATH/TO/cbindna.R")
source("/PATH/TO/ts_summaries.R")
```
The last of these scripts will take a long time to run, which is why it's currently processing the data in chunks. If you choose, you can change this and process it all at once. If not, you'll need to combine the individual chunks afterward (see `compile_ts_df.R`)

You can also confirm our t-test results. First, run `process_means_move.R` and `process_means_viscosity.R` to extract process means from the time-series data. Then run, the scripts, `pairwise_sd_move_loop.R` ,`pairwise_sd_viscosity_loop.R`, `pairwiset_mean_waste_prob_move_loop.R`, and `pairwiset_mean_waste_prob_viscosity_loop.R`.
