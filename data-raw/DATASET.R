## code to prepare `DATASET` dataset goes here

usethis::use_data(fake_10, overwrite = TRUE)

books <- rio::import("data-raw/books.rds")

model <- rio::import("data-raw/model.rds")

model_7 <- rio::import("data-raw/model_7.rds")

new_books <- rio::import("data-raw/new_books.rds")

new_dtm <- rio::import("data-raw/new_dtm.rds")

fake_k4 <- rio::import("data-raw/fake_k4.rds")

fake_500 <- rio::import("data-raw/fake_500.rds")

fake_10 <- rio::import("data-raw/fake_10.rds")



#by_chapter_pos <- rio::import("data-raw/by_chapter_pos.rds")
