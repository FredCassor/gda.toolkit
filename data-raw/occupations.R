## code to prepare `occupations` dataset goes here

data <- system.file("extdata/Occupations-dble-table.csv", package = "gda.toolkit")

# Import du CSV dans un data.frame
occupations <- read.csv2(data, row.names = 1, check.names = FALSE)

# Export du dataset dans data/
usethis::use_data(occupations, overwrite = TRUE)

# Documenting the data
checkhelper::fix_dataset_doc("occupations")
