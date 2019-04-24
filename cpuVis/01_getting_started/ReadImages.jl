using Images

IMG_DIR = "../images"
# Read a single image from disk
img_path = "$IMG_DIR/cat.jpg"
sample_image = nothing

if isfile(img_path)
  sample_image = load(img_path)
else
  println("ERROR: Image not found")
end


# Reading single image from a URL
image_url = "https://cdn.pixabay.com/photo/2018/01/04/18/58/cats-3061372_640.jpg?attachment"
download_path = download(image_url, "$IMG_DIR/cat_download.jpg")
image = load(download_path)
