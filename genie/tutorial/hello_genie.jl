# Run in REPL... running as module will shut down before you can see the page
# render
using Genie, Genie.Router

route("/hello") do
  "Hello, World!"
end

up()
