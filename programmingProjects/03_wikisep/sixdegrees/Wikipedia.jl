module Wikipedia
export fetchrandom, fetchpage, articlelinks, articleinfo


using Cascadia
using Gumbo
using HTTP
import Cascadia: matchFirst # nor publicly exposed method so this makes it vis

include("Articles.jl")
using .Articles


const PROTOCOL = "https://"
const DOMAIN = "en.m.wikipedia.org"
const RANDOM_PAGE_URL = PROTOCOL * DOMAIN * "/wiki/Special:Random"

function fetchpage(url)
  url = startswith(url, "/") ? buildurl(url) : url
  response = HTTP.get(url)
  if response.status == 200 && length(response.body)  > 0
    String(response.body)
  else
    ""
  end
end


function extractlinks(elem)
  map(eachmatch(Selector("a[href^='/wiki/']:not(a[href*=':'])"), elem)) do e
    e.attributes["href"]
  end |> unique
end


function extracttitle(elem)
  matchFirst(Selector("#section_0"), elem) |> nodeText
end


function extractimage(elem)
  e = matchFirst(Selector(".content a.image img"), elem)
  isa(e, Nothing) ? "" : e.attributes["src"]
end


function fetchrandom()
  fetchpage(RANDOM_PAGE_URL)
end


function articledom(content)
  if !isempty(content)
    return Gumbo.parsehtml(content)
  end
  error("Article content cannot be parsed to DOM")
end


function articlelinks(content)
  if !isempty(content)
    return Gumbo.parsehtml(content)
  end
  error("Article content cannot be parsed into dom")
end


function articleinfo(content)
  dom = articledom(content)
  Article(content,
          extractlinks(dom.root),
          extracttitle(dom.root),
          extracttitle(dom.root))
end


function buildurl(articleurl)
  PROTOCOL * DOMAIN * articleurl
end



end
