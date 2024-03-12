library(magick) # load magick library
# link to meme: https://knowyourmeme.com/memes/in-the-studio-like-drop-it/photos/page/2

jcole_face <- "jcoleface.jpg" %>%
  image_read() %>%
  image_crop("300x450+450+10") %>%
  image_scale("150")

# create drop it meme
drop_it_meme <- "drop_it_meme_template.png" %>%
  
  # read image
  image_read() %>%
  # crop image
  image_crop("500x490+0+100") %>%
  
  # add meme text
  image_annotate("J. Cole", gravity = "northwest", location = "+30+10",
                 color = "white", size = 50, weight = 700, font = "sans", 
                 boxcolor = "black") %>%
  image_annotate("in the", gravity = "north", location = "+40",
                 color = "white", strokecolor = "black", strokewidth = 3,
                 size = 50, weight = 700, font = "Impact", kerning = -1) %>%
  image_annotate("studio like", gravity = "north", location = "-80+80",
                 color = "white", strokecolor = "black", strokewidth = 3,
                 size = 50, weight = 700, font = "Impact", kerning = -1) %>%
  image_annotate("drop it", gravity = "south", location = "+0+10",
                 color = "white", strokecolor = "black", strokewidth = 3,
                 size = 50, weight = 700, font = "Impact", kerning = -1) %>%
  image_annotate("yeah this", gravity = "center", location = "-100+80",
                 color = "white", strokecolor = "black", strokewidth = 3,
                 size = 50, weight = 700, font = "Impact", kerning = -1) %>%
  image_annotate("sounds", gravity = "center", location = "+80+80",
                 color = "white", 
                 size = 45, weight = "700", kerning = -1) %>%
  image_annotate("boring as fuck", gravity = "center", location = "+40+130",
                 color = "white", 
                 size = 45, weight = "700", kerning = -1) %>%
  
  
  # "deep fry" meme by sharpening using convolution
  image_convolve('DoG:0,0,2', scaling = '100, 20%')
  


drop_it_meme

# animation
frames <- c(drop_it_meme)
