using JSON


function read_local_keys(keyspath::String, env=nothing)
  open(keyspath, "r") do f
    keys = JSON.parse(f)
    if !isnothing(env)
      keys = Dict(k => keys[k][env] for k in keys)
    end
  end
end





# Test
KEYS = "/Users/dsatterthwaite/config/keys.json"
ENV = "qa"

read_local_keys(KEYS, ENV)
