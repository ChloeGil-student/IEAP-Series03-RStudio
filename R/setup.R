# R/setup.R
# Shared setup: libraries + data loading + cleaning.
# Every .qmd starts with source("../R/setup.R")

library(ez)
library(tidyverse)

# Load the raw data
Results <- read.table("../data/Results.txt", header = TRUE, sep = " ",
                      stringsAsFactors = TRUE)

# Clean data: remove ID3 and REP3 (incomplete conditions)
clean_results <- Results %>%
  filter(ID != "ID3") %>%
  filter(REP != "R3") %>%
  droplevels()
