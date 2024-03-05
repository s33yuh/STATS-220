library(magick)
# link to meme: https://knowyourmeme.com/memes/in-the-studio-like-drop-it/photos/page/2

drop_it_meme <- "drop_it_meme_template.png" %>%
  image_read() %>%
  image_crop("500x500")

drop_it_meme
