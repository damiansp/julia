using JSON


function read_local_keys(keyspath::String, env::Union{String, Nothing}=nothing)
  open(keyspath, "r") do f
    global mykeys
    mykeys = JSON.parse(f)
    if !isnothing(env)
      mykeys = Dict(k => mykeys[k][env] for k in keys(mykeys))
    end
  end
  mykeys
end


# Test
KEYS = "/Users/dsatterthwaite/config/keys.json"
ENV = "qa"

mykeys = read_local_keys(KEYS, ENV)


