library(GGally)

## ---- penguin-pairs ----

penguins %>%
  mutate(species = as.character(species)) %>%
  mutate(species = case_when(
    species == "Adelie" ~ "Adélie",
    TRUE ~ species
  )) %>%
  select(species, where(is.numeric)) %>%
  GGally::ggpairs(aes(color = species, shape = species),
          columns = c("flipper_length_mm", "body_mass_g",
                      "bill_length_mm", "bill_depth_mm"),
          columnLabels = c("Flipper length (mm)","Body mass (g)", "Bill length (mm)", "Bill depth (mm)")) +
  scale_shape_manual(values = c(15,16,17)) +
  theme_minimal() +
  theme(
        text = element_text(size = 9),
        panel.grid.major = element_line(colour = NA),
        panel.grid.minor = element_blank(),
        panel.border = element_rect(color = "gray80", fill = NA)
        )


## ---- iris-pairs ----

iris %>%
  GGally::ggpairs(aes(color = Species, shape = Species),
          columns = c("Petal.Length", "Petal.Width",
                      "Sepal.Length", "Sepal.Width"),
          columnLabels = c("Petal length (cm)","Petal width (cm)", "Sepal length (cm)", "Sepal width (cm)")) +
  scale_colour_manual(values = c("gray70","gray40","black")) +
  scale_fill_manual(values = c("gray70","gray40","black")) +
  theme_minimal() +
  theme(
        text = element_text(size = 9),
        panel.grid.major = element_line(colour = NA),
        panel.grid.minor = element_blank(),
        panel.background = element_rect(fill = "white", color = "gray80")
        )
