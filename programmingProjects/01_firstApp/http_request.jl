using Gumbo
using HTTP


resp = HTTP.get("https://en.wikipedia.org/wiki/Julia_(programming_language)")
println(fieldnames(typeof(resp))) # (:version, :status, :body, :request)
println(resp.status)              # 200
println(resp.headers)             # ["Date" => "Sat 23 Mar 2019...
#println(resp.body) # binary

resp_body = String(resp.body)     
println(resp_body[1:500])         # <!DOCTYP html> ...

headers = Dict(resp.headers)
println(headers)                  # "Connection" => "keep-alive", "Via" => ...
println(headers["Content-Length"]) # 205823

dom = parsehtml(resp_body)
println(fieldnames(typeof(dom)))   # (:doctype, :root)
println(dom.doctype)               # html
println(dom.root.attributes)       # "class" => "client-nojs", "lang" => "en"...
println(attrs(dom.root))           # '''        '''             ''       ''

println(tag(dom.root)) # :HTML
for c in children(dom.root)
  @show tag(c)
end

body = children(dom.root)[2]
println(getattr(dom.root, "class")) # client-nojs
println(in("href", collect(keys(attrs(dom.root))))) # false



# Pipe operator: |>
println(keys(attrs(dom.root)))
dom.root |> attrs |> keys |> collect |> println


# try/catch/finally
try
  getattr(dom.root, "href")
catch
  println("The $(tag(dom.root)) tag doesn't have an 'href' attribute.")
end


try
  getattr(dom.root, "href")
catch ex
  if isa(ex, KeyError)
    println("The $(tag(dom.root)) tag doesn't have an '$(ex.key)' attribute")
  else
    println("Unexpected Error.")
  end
finally
  println("Print me no matter what.")
end


result = try
  error("Oh no!")
catch ex
  "everything under control"
end

println(result)
