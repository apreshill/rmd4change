shrimpiest_penguins <- 
  penguins %>% 
  group_by(species) %>% 
  summarize(min_mass = min(body_mass_g, na.rm = TRUE))
