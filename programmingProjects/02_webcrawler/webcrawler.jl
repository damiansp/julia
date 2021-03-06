using Gumbo
using HTTP


const PAGE_URL = "https://en.wikipedia.org/wiki/Julia_(programming_language)"
const LINKS = String[] # same as Array{String, 1}()


function fetch_page(url)
  response = HTTP.get(url)
  if (response.status == 200
      && parse(Int, Dict(response.headers)["Content-Length"]) > 0)
    String(response.body)
  else
    ""
  end
end


function extract_links(elem)
  if (isa(elem, HTMLElement)
      && tag(elem) == :a
      && in("href", collect(keys(attrs(elem)))))
    url = getattr(elem, "href")
    startswith(url, "/wiki/") && !occursin(":", url) && push!(LINKS, url)
  end
  for child in children(elem)
    extract_links(child)
  end
end


content = fetch_page(PAGE_URL)
if !isempty(content)
  dom = Gumbo.parsehtml(content)
  extract_links(dom.root)
end

display(unique(LINKS))
