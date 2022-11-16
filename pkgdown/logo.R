library(ggplot2)
library(hexSticker)

# make a heart with math!
t <- seq(0, 2*pi, by=0.05) |> c(0)
heart <- data.frame(
  x = 16*sin(t)^3,
  y = 13*cos(t)-5*cos(2*t)-2*cos(3*t)-cos(4*t)
)

heartplot <- ggplot(heart, aes(x, y)) +
  geom_point(color = "hotpink") +
  theme_void()

# customise your hex sticker
hexSticker::sticker(
  filename = "inst/figures/logo.png",
  # subplot aesthetics
  subplot = heartplot,
  s_width = 1.0, s_height = .85,
  s_x=1, s_y=.75,
  # package name aesthetics
  package = "demopkg",
  p_size = 25,
  p_color = "black",
  # hexagon aesthetics
  h_size = 1,
  h_fill = "pink",
  h_color = "hotpink",
  # url aesthetics
  url = "psyteachr.github.io/demopkg",
  u_size = 5.4,
  u_color = "black"
) |> plot() # preview with plot()


library(badger)

badge_doi("10.1098/rspb.2004.2824", "firebrick")
badge_custom(
  "ORCiD",
  "0000-0002-7523-5539",
  "dodgerblue",
  "https://orcid.org/0000-0002-7523-5539"
)
