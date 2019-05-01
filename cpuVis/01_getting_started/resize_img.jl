using Images
using ImageView


img = load("../images/cat_download.jpg")
resized_img = imresize(img, (100, 250))
#imshow(resized_img)
