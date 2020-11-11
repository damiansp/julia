using Genie, Genie.Renderer, Genie.Renderer.Html, Genie.Renderer.Json,
  Genie.Router

route("/hello.html") do
  html("Hello, World!")
end

route("/hello.json") do
  json("Hello, World!")
end

route("/hello.txt") do
  respond("Hello, World", :text)
end

println("Server running on localhost:8001")
up(8001, async=false)
