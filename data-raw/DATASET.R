## code to prepare `DATASET` dataset goes here

usethis::use_data(DATASET, overwrite = TRUE)
books <- rio::import("data-raw/books.rds")
