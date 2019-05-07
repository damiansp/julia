module Articles
export Article


struct Article
  content::String
  links::Vector{String}
  title::String
  image::String

  Article(; content="", links=String[], title="", image="") = new(
    content, links, title, image)
  Article(content, links, title, image) = new(content, links, title, image)
end


end
