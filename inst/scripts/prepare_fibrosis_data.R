# Convert the Part III pulmonary fibrosis objects into package datasets.
#
# The three input .rds files were prepared from GEO accession GSE250346.
# Run from the package root, passing the folder that holds the .rds files:
#
#   Rscript inst/scripts/prepare_fibrosis_data.R ~/workshop
#
# This writes data/fibrosis_spe.rda, data/fibrosis_pb_spe.rda and
# data/fibrosis_pseudobulk_counts.rda, which load_data("fibrosis") returns.

SOURCE_FILES <- c(
  fibrosis_spe = "fibrosis_data.rds",
  fibrosis_pb_spe = "fibrosis_pb.rds",
  fibrosis_pseudobulk_counts = "fibrosis_psuedobulk.rds"
)

args <- commandArgs(trailingOnly = TRUE)
if (length(args) != 1L) {
  stop("Usage: Rscript inst/scripts/prepare_fibrosis_data.R <folder with the .rds files>")
}

source_paths <- file.path(path.expand(args[[1]]), SOURCE_FILES)
is_missing <- !file.exists(source_paths)
if (any(is_missing)) {
  stop("Input file(s) not found: ", paste(source_paths[is_missing], collapse = ", "))
}

suppressPackageStartupMessages(library(SpatialExperiment))
fibrosis_spe <- readRDS(source_paths[[1]])
fibrosis_pb_spe <- readRDS(source_paths[[2]])
fibrosis_pseudobulk_counts <- readRDS(source_paths[[3]])

usethis::use_data(
  fibrosis_spe,
  fibrosis_pb_spe,
  fibrosis_pseudobulk_counts,
  compress = "bzip2"
)
