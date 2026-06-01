#' @inherit mapnhanespa::map_nhanes_pa_quantiles
#' @export
#' @rdname acti_map_nhanes
#'
#' @examples
#' example_data <- data.frame(
#'   id = 1:2,
#'   age = c(25, 62),
#'   sex = c("Female", "Male"),
#'   measure = c("mims", "ssl_steps"),
#'   value = c(15000, 7500)
#' )
#'
#' acti_map_nhanes(example_data)
acti_map_nhanes <- function(data,
                            id = NULL,
                            age = "age",
                            sex = "sex",
                            measure = "measure",
                            value = "value",
                            wave = NULL,
                            age_category = NULL,
                            quantile_col = "acti_pa_quantile") {
  mapnhanespa::map_nhanes_pa_quantiles(
    data = data,
    id = id,
    age = age,
    sex = sex,
    measure = measure,
    value = value,
    wave = wave,
    age_category = age_category,
    quantile_col = quantile_col
  )
}
