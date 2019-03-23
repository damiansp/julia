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

        
