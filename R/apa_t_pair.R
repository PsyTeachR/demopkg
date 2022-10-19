apa_t_pair <- function(x, y,
                       dv = "the DV",
                       level1 = "level 1",
                       level2 = "level 2") {
  t_results <- t.test(
    x = x,
    y = y,
    paired = TRUE
  )

  template <- "A paired-samples t-test was conducted to compare {dv} between {level1} (M = {mean1}, SD = {sd1}) and {level2} (M = {mean2}, SD = {sd2}). There was a {non}significant difference; t({df}) = {t_value}, p = {p_value}."

  apa_text <- glue::glue(template,
             mean1 = round0(mean(x), 1),
             mean2 = round0(mean(y), 1),
             sd1 = round0(sd(x), 1),
             sd2 = round0(sd(y), 1),
             df = t_results$parameter,
             t_value = round0(t_results$statistic, 2),
             p_value = round0(t_results$p.value, 3),
             non = if (t_results$p.value < .05) "" else "non-"
  )

  return(apa_text)
}


round0 <- function(x, digits = 0) {
  # create formatting string
  fmt <- paste0("%.", digits, "f")
  x0 <- sprintf(fmt, x)

  return(x0)
}
