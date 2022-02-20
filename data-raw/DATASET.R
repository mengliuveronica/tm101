## code to prepare `DATASET` dataset goes here

usethis::use_data(DATASET, overwrite = TRUE)
books <- rio::import("data-raw/books.rds")

model <- rio::import("data-raw/model.rds")

model_7 <- rio::import("data-raw/model_7.rds")

new_books <- rio::import("data-raw/new_books.rds")

new_dtm <- rio::import("data-raw/new_dtm.rds")
