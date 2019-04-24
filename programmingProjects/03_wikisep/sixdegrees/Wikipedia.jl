module Wikipedia
export fetchrandom, fetchpage, articlelinks


using Cascadia
using Gumbo
using HTTP

import Cascadia: matchFirst # nor publicly exposed method so this makes it vis


const PROTOCOL = "https://"
const DOMAIN = "en.m.wikipedia.org"
const RANDOM_PAGE_URL = buildurl("/wiki/Special:Random")


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


function fetchrandom()
  fetchpage(RANDOM_PAGE_URL)
end


function articlelinks(content)
  if !isempty(content)
    dom = Gumbo.parsehtml(content)
    links = extractlinks(dom.root)
  end
end


function buildurl(articleurl)
  PROTOCOL * DOMAIN * articleurl
end


function extracttitle(elem)
  matchFirst(Selector("#section_0"), elem) |> nodeText
end


function extractimage(elem)
  e = matchFirst(Selector(".content a.image img"), elem)
  isa(e, Void) ? "" : e.attributes["src"]
end



end
