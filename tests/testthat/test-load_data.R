test_that("load_data rejects a bundle name that is not a single string", {
  expect_error(load_data(1), "must be a single string")
  expect_error(load_data(c("fibrosis", "fibrosis")), "must be a single string")
  expect_error(load_data(NA_character_), "must be a single string")
})

test_that("load_data names the available bundles when given an unknown one", {
  expect_error(load_data("not_a_bundle"), 'Unknown dataset bundle "not_a_bundle".*fibrosis')
})

test_that("every dataset listed in a bundle exists in data/", {
  # Arrange
  bundled <- unlist(DATASET_BUNDLES, use.names = FALSE)

  # Act
  shipped <- utils::data(package = PKG_NAME)$results[, "Item"]

  # Assert
  expect_setequal(intersect(bundled, shipped), bundled)
})

test_that("load_data('fibrosis') returns the three fibrosis objects by name, in order", {
  # Act
  fibrosis <- load_data("fibrosis")

  # Assert
  expect_type(fibrosis, "list")
  expect_named(fibrosis, c("spe", "pb_spe", "pseudobulk_counts"))
  expect_s4_class(fibrosis$spe, "SpatialExperiment")
  expect_s4_class(fibrosis$pb_spe, "SpatialExperiment")
  expect_s4_class(fibrosis$pseudobulk_counts, "SummarizedExperiment")
})
