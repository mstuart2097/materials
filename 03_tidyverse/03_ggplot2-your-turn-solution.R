library(tidyverse)
temps <- readRDS("../data/temps.rds")
stations <- readRDS("../data/USHCNstations.rds") # to extract 'good' weather stations

temps %>% filter(Station == "USH00012813") %>%
  ggplot(aes(x = Year+Month/12, y = Temp)) +
  geom_line()

temps %>% filter(Station %in% c("USH00012813", "USH00454764")) %>%
  ggplot(aes(x = Year+Month/12, y = Temp)) +
  geom_line(aes(group = Station))

temps %>% filter(Station %in% c("USH00012813", "USH00454764")) %>%
  ggplot(aes(x = Year+Month/12, y = Temp)) +
  geom_line(aes(group = Station, colour=Station))

temps %>% filter(Station %in% c("USH00012813", "USH00454764")) %>%
  ggplot(aes(x = Year+Month/12, y = Temp)) +
  geom_line(aes(group = Station, colour=Station)) +
  geom_text(data = temps %>%
              filter(Year == 2016, Month==7,
                     Station %in% c("USH00012813", "USH00454764")),
            aes(label = Station))

