PKG_NAME <- "CosMxSpatialAnalysisWorkshop"

# Datasets returned by load_data(), keyed by bundle name. Each entry maps the
# name the object is returned under to its dataset name in data/. The order
# here is the order the objects are returned in.
DATASET_BUNDLES <- list(
  fibrosis = c(
    spe = "fibrosis_spe",
    pb_spe = "fibrosis_pb_spe",
    pseudobulk_counts = "fibrosis_pseudobulk_counts"
  )
)

.myDataEnv <- new.env(parent = emptyenv()) # not exported

# Load a dataset from data/ once per session and return it from the cache.
.data_internal <- function(dataset) {
  if (!exists(dataset, envir = .myDataEnv, inherits = FALSE)) {
    utils::data(list = dataset, package = PKG_NAME, envir = .myDataEnv)
  }
  object <- get(dataset, envir = .myDataEnv, inherits = FALSE)
  .load_class_namespace(object)
}

# data() does not load the package that defines an S4 object's class, so
# methods such as dim() would not dispatch (dim(spe) returns NULL) until that
# package is loaded. Load it here so the object works straight away.
.load_class_namespace <- function(object) {
  class_pkg <- attr(class(object), "package")
  if (!is.null(class_pkg)) {
    loadNamespace(class_pkg)
  }
  object
}

#' Load the datasets used in a workshop part
#'
#' Loads every dataset in a named bundle in one call. The `"fibrosis"` bundle
#' (Part III) contains `spe` ([fibrosis_spe]), `pb_spe` ([fibrosis_pb_spe])
#' and `pseudobulk_counts` ([fibrosis_pseudobulk_counts]). Datasets are read
#' from disk once per R session; later calls reuse them.
#'
#' @param name Name of the bundle to load, e.g. `"fibrosis"`.
#'
#' @return A named list with one element per dataset in the bundle. For
#'   `"fibrosis"`: `spe`, `pb_spe` and `pseudobulk_counts`.
#'
#' @examples
#' \dontrun{
#' fibrosis <- load_data("fibrosis")
#' spe <- fibrosis$spe
#' pb_spe <- fibrosis$pb_spe
#' pseudobulk_counts <- fibrosis$pseudobulk_counts
#' }
#'
#' @export
load_data <- function(name) {
  if (!is.character(name) || length(name) != 1L || is.na(name)) {
    stop('`name` must be a single string, e.g. load_data("fibrosis").', call. = FALSE)
  }
  if (!name %in% names(DATASET_BUNDLES)) {
    stop(
      sprintf(
        'Unknown dataset bundle "%s". Available bundles: %s.',
        name, paste(names(DATASET_BUNDLES), collapse = ", ")
      ),
      call. = FALSE
    )
  }

  # Named list in DATASET_BUNDLES order: spe, pb_spe, pseudobulk_counts.
  lapply(DATASET_BUNDLES[[name]], .data_internal)
}
