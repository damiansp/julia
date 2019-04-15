module Wikipedia
export fetchrandom, fetchpage, articlelinks



using Gumbo
using HTTP


const RANDOM_PAGE_URL = "https://en.m.wikipedia.org/wiki/Special:Random"


function fetchpage(url)
  response = HTTP.get(url)
  if response.status == 200 && length(response.body)  > 0
    String(response.body)
  else
    ""
  end
end


function extractlinks(elem, links=String[])
  if (isa(elem, HTMLElement)
      && tag(elem) == :a
      && in("href", collect(keys(attrs(elem)))))
    url = getattr(elem, "href")
    startswith(url, "/wiki/") && !occursin(":", url) && push!(links, url)
  end
  for child in children(elem)
    extractlinks(child, links)
  end
  unique(links)
end


function fetchrandom()
  fetchpage(RANDOM_PAGE_URL)
end


function articlelinks(content)
  if !isempty(content)
    dom = Gumbo.parsehtml(content)
    links = extractlinks(dom.root)
  end
end



end
