## code to prepare `self_res_att` dataset goes here
library(readr)

ct <- cols(
  id = col_character(),
  sex = col_factor(levels = c("female", "male")),
  ethgroup = col_factor(),
  age = col_double(),
  m_non = col_double(),
  f_non = col_double(),
  m_self = col_double(),
  f_self = col_double(),
  grpsize = col_double(),
  group = col_double(),
  mascpref = col_double(),
  obro = col_double(),
  osis = col_double(),
  ybro = col_double(),
  ysis = col_double(),
  birthorder = col_factor(levels = c("only", "firstborn", "middleborn", "lastborn"))
)

self_res_att <- readr::read_csv("data-raw/DeBruine_2004_PRSLB_att.csv", col_types = ct)

usethis::use_data(self_res_att, overwrite = TRUE)

## set up documentation

coldesc <- rep("", ncol(self_res_att))
names(coldesc) <- names(self_res_att)
dput(coldesc)

vars <- c(
  "id" = "participant unique ID",
  "sex" = "sex of the participant (male/female)",
  "ethgroup" = "ethnic group of the participant (east_asian/west_asian/white)",
  "age" = "age of the participant in years",
  "m_non" = "mean number of times the other group members chose that male face as more attractive",
  "f_non" = "mean number of times the other group members chose that female face as more attractive",
  "m_self" = "number of times out of a possible 6 chose their male self-res face as more attractive",
  "f_self" = "number of times out of a possible 6 chose their female self-res face as more attractive",
  "grpsize" = "size of the group",
  "group" = "unique group ID",
  "mascpref" = "masculinity preference on an unrelated face preference task",
  "obro" = "number of older brothers",
  "osis" = "number of older sisters",
  "ybro" = "number of younger brothers",
  "ysis" = "number of younger sisters",
  "birthorder" = "birth order (only/firstborn/middleborn/lastborn) as calculated from number of younger and older brothers and sisters"
)

glue::glue("#'   \\item{[colname]}{[coldesc]}",
           colname = names(vars),
           coldesc = vars,
           .open = "[",
           .close = "]")
