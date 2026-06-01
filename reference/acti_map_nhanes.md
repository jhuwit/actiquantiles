# Map physical activity values to NHANES population quantiles

`map_nhanes_pa_quantiles()` adds a population-level quantile column to a
participant-level data frame. Quantiles are evaluated from NHANES
accelerometer cumulative distribution functions stratified by age
category, sex/gender, measure, and optionally survey wave.

## Usage

``` r
acti_map_nhanes(
  data,
  id = NULL,
  age = "age",
  sex = "sex",
  measure = "measure",
  value = "value",
  wave = NULL,
  age_category = NULL,
  quantile_col = "acti_pa_quantile"
)
```

## Arguments

- data:

  A data frame with one row per participant-measure observation.

- id:

  Optional participant identifier column name. The column is checked
  when supplied, but otherwise left unchanged.

- age, sex, measure, value:

  Column names in `data` containing age in years, sex/gender, physical
  activity measure, and observed value. Set `age = NULL` to use the
  age-overall CDFs. Set `sex = NULL` to use the sex/gender-overall CDFs.
  Setting both to `NULL` uses the overall CDF across both dimensions.

- wave:

  Optional NHANES wave column name or scalar value. Supported values are
  `7`, `8`, `"2011-2012"`, and `"2013-2014"`. If `NULL`, the combined
  wave CDFs are used.

- age_category:

  Optional column name containing NHANES age categories such as
  `"[20,30)"` or `"Overall"`. When supplied, it is used instead of
  `age`.

- quantile_col:

  Name of the output quantile column.

## Value

`data` with an added quantile column.

## Examples

``` r
example_data <- data.frame(
  id = 1:2,
  age = c(25, 62),
  sex = c("Female", "Male"),
  measure = c("mims", "ssl_steps"),
  value = c(15000, 7500)
)

acti_map_nhanes(example_data)
#>   id age    sex   measure value acti_pa_quantile
#> 1  1  25 Female      mims 15000        0.5349443
#> 2  2  62   Male ssl_steps  7500        0.3527381
```
