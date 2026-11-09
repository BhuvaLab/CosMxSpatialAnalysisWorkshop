#' Sub-sampled CosMx non-small cell lung cancer (NSCLC) spatial transcriptomics dataset
#'
#' A Bruker CosMx spatial transcriptomics dataset containing a sub-region of a non-small cell lung cancer (NSCLC) sample. The data contains pathology annotations. The full dataset is available through the SubcellularSpatialData R/Bioconductor package.
#'
#' @format A SpatialExperiment object.
#' @docType data
#' @references Bhuva DD, Tan CW, Salim A, Marceaux C, Pickering MA, Chen J, Kharbanda M, Jin X, Liu N, Feher K, Putri G. Library size confounds biology in spatial transcriptomics data. Genome Biology. 2024 Apr 18;25(1):99.
#' 
#'  Bhuva DD, Tan CW, Marceaux C, Pickering M, Salim A, Chen J, Kharbanda M, Jin X, Liu N, Feher K, et al. Library size confounds biology in spatial transcriptomics data. 2024. Zenodo. https://doi.org/10.5281/zenodo.7959786.
#' 
#'  Bhuva DD: SubcellularSpatialData: annotated spatial transcriptomics datasets from 10x Xenium, NanoString CosMx and BGI STOmics. Bioconductor. 2024 https://doi.org/10.18129/B9.bioc.SubcellularSpatialData.
#' 
#'  Bhuva DD. Library size confounds biology in spatial transcriptomics. 2024. Zenodo. https://doi.org/10.5281/zenodo.10946961.
#' 
"lung5"

#' Pseudo-bulked single-cell non-small cell lung cancer (NSCLC) atlas reference dataset
#'
#' A pseudo-bulked single-cell RNA-seq non-small cell lung cancer (NSCLC) atlas dataset from the study by Salcher et al., Cancer Cell, 2022. The original dataset has been subsetted to the genes present in the 10x Xenium dataset.
#'
#' @format A SingleCellExperiment object.
#' @docType data
# 
#' @references Salcher S, Sturm G, Horvath L, Untergasser G, Kuempers C, Fotakis G, Panizzolo E, Martowicz A, Trebo M, Pall G, Gamerith G. High-resolution single-cell atlas reveals diversity and plasticity of tissue-resident neutrophils in non-small cell lung cancer. Cancer cell. 2022 Dec 12;40(12):1503-20.
#' 
"ref_luca"

#' Pulmonary fibrosis spatial transcriptomics dataset (cell level)
#'
#' Cell-level metadata and spatial coordinates for 1,571,449 cells measured
#' with a 343-gene panel across 45 samples from 35 patients (control and
#' pulmonary fibrosis lungs). The object carries no assays; use
#' [fibrosis_pb_spe] or [fibrosis_pseudobulk_counts] for expression. Load it
#' together with the other fibrosis datasets using `load_data("fibrosis")`.
#'
#' @format A SpatialExperiment object with 343 rows (genes) and 1,571,449
#'   columns (cells). Key `colData` columns: `sample_id`, `patient`,
#'   `disease_status`, `tma`, `final_CT` (cell type), `CNiche` (cellular
#'   niche), `nCount_RNA` and `nFeature_RNA`. Spatial coordinates are
#'   `super_adj_x_centroid` and `super_adj_y_centroid`.
#' @docType data
#' @source GEO accession GSE250346,
#'   <https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE250346>. See
#'   `inst/scripts/prepare_fibrosis_data.R`.
#' @references Vannan A, Lyu R, Williams AL, et al. Spatial transcriptomics
#'   identifies molecular niche dysregulation associated with distal lung
#'   remodeling in pulmonary fibrosis. Nature Genetics. 2025.
#' @seealso [load_data()]
"fibrosis_spe"

#' Pulmonary fibrosis pseudobulk dataset (SpatialExperiment)
#'
#' Counts from [fibrosis_spe] summed within each sample, cellular niche and
#' cell type, giving 14,645 pseudobulk profiles.
#'
#' @format A SpatialExperiment object with 343 rows (genes) and 14,645
#'   columns (pseudobulk profiles), with a `counts` assay. Key `colData`
#'   columns: `sample`, `patient`, `disease_status`, `final_CT`, `CNiche`.
#' @docType data
#' @source GEO accession GSE250346. See `inst/scripts/prepare_fibrosis_data.R`.
#' @seealso [load_data()], [fibrosis_spe]
"fibrosis_pb_spe"

#' Pulmonary fibrosis pseudobulk counts
#'
#' Counts from [fibrosis_spe] summed within each sample, cellular niche
#' (`CNiche`) and cell type (`final_CT`), with the number of cells in each
#' profile.
#'
#' @format A SummarizedExperiment object with 343 rows (genes) and 14,645
#'   columns (pseudobulk profiles), with a `sum` assay. `colData` columns:
#'   `sample`, `CNiche`, `final_CT` and `ncells`.
#' @docType data
#' @source GEO accession GSE250346. See `inst/scripts/prepare_fibrosis_data.R`.
#' @seealso [load_data()], [fibrosis_spe]
"fibrosis_pseudobulk_counts"
