library(tidyverse)
path <- "/Users/hofmann/Documents/Zoom"

files <- dir(path=path, pattern=".txt", recursive=TRUE, full.names = TRUE)

dframe <- data.frame(files = files)

dframe <- dframe %>% mutate(
  what = files %>% purrr::map(readLines)
) %>% unnest(col=what)

dframe <- dframe %>% mutate(
  From = gsub(".* From (.*) : .*", "\\1", what),
  meeting = gsub(".*Zoom/[^A-Z]*(.*)/meeting_svaed_chat.txt", "\\1", files)
)
