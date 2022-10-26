#' APA Text for Paired-Samples T-Test
#'
#' @description
#' Create APA-formatted text for the results of a paired-samples t-test in the following format:
#'
#' A paired-samples t-test was conducted to compare \{dv\} between \{level1\} (M = \{mean1\}, SD = \{sd1\}) and \{level2\} (M = \{mean2\}, SD = \{sd2\}). There was a \{non\}significant difference; t(\{df\}) = \{t_value\}, p = \{p_value\}.
#'
#' @param x A (non-empty) numeric vector of data values for level 1.
#' @param y A (non-empty) numeric vector of data values for level 2.
#' @param dv The text describing the DV in the output text.
#' @param level1 The text describing level 1 in the output text.
#' @param level2 The text describing level 2 in the output text.
#' @param alpha The critical alpha for determining significance.
#'
#' @return A character string of the results text.
#' @export
#'
#' @examples
#' # use generic text
#' apa_t_pair(x = self_res_att$f_self,
#'            y = self_res_att$f_non)
#'
#' # specify the text for dv and levels
#' apa_t_pair(x = self_res_att$f_self,
#'            y = self_res_att$f_non,
#'            dv = "preferences for female faces",
#'            level1 = "participants who resembled those faces",
#'            level2 = "non-self participants")
apa_t_pair <- function(x, y,
                       dv = "the DV",
                       level1 = "level 1",
                       level2 = "level 2",
                       alpha = 0.05) {
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
             non = if (t_results$p.value < alpha) "" else "non-"
  )

  return(apa_text)
}





#' Custom Rounding Function
#'
#' Rounds a number and returns a string with the required number of digits after the decimal point, including trailing zeroes, if applicable.
#'
#' @param x A numeric vector.
#' @param digits Integer indicating the number of decimal places to be used.
#'
#' @return A character string of the formatted x value(s)
#'
round0 <- function(x, digits = 0) {
  # create formatting string
  fmt <- paste0("%.", digits, "f")
  x0 <- sprintf(fmt, x)

  return(x0)
}
