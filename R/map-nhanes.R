#' Map physical activity values to NHANES quantiles
#'
#' `acti_map_nhanes_pa_quantiles()` is a thin wrapper around
#' [mapnhanespa::map_nhanes_pa_quantiles()] that keeps the package's `acti_`
#' prefix while returning a standardized quantile column name.
#'
#' @param data A data frame with one row per participant-measure observation.
#' @param id Optional participant identifier column name. The column is checked
#'   when supplied, but otherwise left unchanged.
#' @param age,sex,measure,value Column names in `data` containing age in years,
#'   sex/gender, physical activity measure, and observed value. Set `age = NULL`
#'   to use the age-overall CDFs. Set `sex = NULL` to use the sex/gender-overall
#'   CDFs. Setting both to `NULL` uses the overall CDF across both dimensions.
#' @param wave Optional NHANES wave column name or scalar value. Supported
#'   values are `7`, `8`, `"2011-2012"`, and `"2013-2014"`. If `NULL`, the
#'   combined wave CDFs are used.
#' @param age_category Optional column name containing NHANES age categories
#'   such as `"[20,30)"` or `"Overall"`. When supplied, it is used instead of
#'   `age`.
#' @param quantile_col Name of the output quantile column.
#'
#' @return `data` with an added quantile column.
#' @export
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
