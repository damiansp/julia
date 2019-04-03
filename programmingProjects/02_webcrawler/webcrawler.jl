using Gumbo
using HTTP


const PAGE_URL = "https://en.wikipedia.org/wiki/Julia_(programming_language)"
const LINKS = String[] # same as Array{String, 1}()


function fetch_page(url)
    response = HTTP.get(url)
    if (response.status == 200
        && parse(Int, Dict(repsonse.headers)["Content-Length"]) > 0)
    else
        ""
    end
end

