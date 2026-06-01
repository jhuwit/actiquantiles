test_that("acti_map_nhanes_pa_quantiles delegates to mapnhanespa", {
  data <- data.frame(
    id = c("A", "B"),
    age = c(25, 62),
    sex = c("Female", "Male"),
    measure = c("mims", "ssl_steps"),
    value = c(15000, 7500)
  )

  wrapped <- acti_map_nhanes(data)
  direct <- mapnhanespa::map_nhanes_pa_quantiles(
    data,
    quantile_col = "acti_pa_quantile"
  )

  expect_identical(wrapped, direct)
  expect_true("acti_pa_quantile" %in% names(wrapped))
})
