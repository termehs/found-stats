library(ggplot2)
library(ggridges)
library(dplyr)
library(viridis) 

n_lines <- 40
x_vals <- seq(-10, 10, length.out = 100)


set.seed(772010823)
data <- lapply(1:n_lines, function(i) {
  mean_i <- runif(1, -4, 4)
  sd_i <- runif(1, 0.7,7)
  y <- dnorm(x_vals, mean = mean_i, sd = sd_i)
  y <- y + rnorm(length(y), mean = 0, sd = 0.002)
  data.frame(x = x_vals, y = y, group = as.factor(n_lines - i))
}) %>%
  bind_rows()


ggplot(data, aes(x = x, y = group, height = y, group = group, fill = group)) +
  geom_ridgeline(alpha = 0.5, color = "black", scale = 17) +
  scale_fill_viridis_d(option = "magma") +  
  theme_void() +
  theme(
    panel.background = element_rect(fill = "white", color = NA),
    plot.background = element_rect(fill = "white", color = NA),
    legend.position = "none"  
  )

