library(magick)
# link to meme: https://knowyourmeme.com/memes/in-the-studio-like-drop-it/photos/page/2

drop_it_meme <- "drop_it_meme_template.png" %>%
  image_read() %>%
  image_crop("500x490+0+100") %>%
  image_annotate("drop it", gravity = "south", location = "+0+10",
                 color = "white", strokecolor = "black", strokewidth = 2,
                 size = 40, weight = 700, font = "Impact", kerning = -1) %>%
  image_annotate("yeah this", gravity = "center", location = "-100+90",
                 color = "white", strokecolor = "black", strokewidth = 2,
                 size = 40, weight = 700, font = "Impact", kerning = -1) %>%
  image_annotate("sounds", gravity = "center", location = "+40+90",
                 color = "white", 
                 size = 35, weight = "700", kerning = -1) %>%
  image_annotate("boring as fuck", gravity = "center", location = "+40+130",
                 color = "white", 
                 size = 35, weight = "700", kerning = -1)

  
drop_it_meme
