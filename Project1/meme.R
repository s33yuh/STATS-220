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
  image_convolve('DoG:0,0,2', scaling = '100, 20%') %>%
  
  # write finished meme to image file
  image_write("my_drop_it_meme.jpg")

  #%>%
  #image_convert(type = "Bilevel")
  

#drop_it_meme


# Kodak Black Meme:


# Kodak Black's face 
kodak_face <- "kodak.jpg" %>%
              image_read() %>%
              # scale and crop image
              image_crop("400x300") %>%
              image_scale("286") %>%
              # modulate image to add character
              image_modulate(saturation = 130, brightness = 110, hue = 110) %>%
              # add thin yellow border
              image_border("yellow", "1x1")
              
# person falling out of car (slightly different from inspo)
thrown_out <- "falling_out_of_car.jpg" %>%
              image_read() %>%
              # crop and scale image
              image_crop("600x350+50") %>%
              image_scale("286") %>%
              # modulate image to add character
              image_modulate(saturation = 150, brightness = 110, hue = 110) %>%
              # add thin yellow border
              image_border("yellow", "1x1")
                  



# meme background boxes
kodak_box <- image_blank(290, 290, "black") %>%
             image_composite(kodak_face, offset = "+1+40")
thrown_out_box <- image_blank(290, 290, "black") %>%
                  image_composite(thrown_out, offset = "+1+60")



# meme text box
text_box <- image_blank(500, 350, "white") %>%
  image_annotate("\"Can we listen to some J. cole\"", 
                 gravity = "north", location = "+0+15",
                 weight = 500, size = 30, font = "sans")

# append both images
kodak_meme_body <- c(kodak_box, thrown_out_box) %>%
                   image_append() %>%
                   image_scale("490")

# combine text box and image box
kodak_meme <- text_box %>% 
              image_composite(kodak_meme_body, offset = "+5+70") %>%
              # "deep fry" meme by sharpening using convolution
              image_convolve('DoG:0,0,2', scaling = '100, 20%') %>%
              # write finished meme to .jpg file
              image_write("my_kodak_meme.jpg")
              
  

kodak_meme

# animation
frames <- c(drop_it_meme)
