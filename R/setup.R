# R/setup.R
# Shared setup: libraries + data loading + cleaning.
# Sourced once at the top of the master document. 
library(ez)
library(tidyverse)
library(here)

# Load the raw data
Results <- read.table(here("data", "Results.txt"), header = TRUE, sep = " ",
                      stringsAsFactors = TRUE)

# Clean data: remove ID3 and REP3 (incomplete conditions)
clean_results <- Results %>%
  filter(ID != "ID3") %>%
  filter(REP != "R3") %>%
  droplevels() %>%
  mutate(
    GROUP  = factor(GROUP, levels = c("pp", "ap", "cp")),
    ID_num = ifelse(ID == "ID1", 3.80, 5.43)
  )