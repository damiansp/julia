using Genie.Renderer.Html, Genie.Requests, Genie.Router

form = """
<form action="/" method="POST" enctype="multipart/form-data">
  <input type="text" name="name" value="" placeholder="Name?" />
  <input type="submit" value="Greet" />
</form>
"""

route("/") do
  #serve_static_file("welcome.html")
  html(form)
end

route("/", method=POST) do
  "Hello there, $(postpayload(:name, "Pardner"))"
end


route("/hello") do
  # without using Requests:
  # name = haskey(@params, :name) ? @params(:name) : "Pardner"
  #"Welcome to Genie, $(name)!"

  # with Requests:
  "Well now, welcome to Genie, $(getpayload(:name, "Pardner"))"
end
