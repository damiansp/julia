using Images
using ImageView


source_image = load("../images/cat_download.jpg")
print(size(source_image)) # h, w
cropped_image = source_image[100:290, 280:540]
imshow(cropped_image)

cropped_image_view = view(source_image, 100:290, 280:540)
imshow(cropped_image)
