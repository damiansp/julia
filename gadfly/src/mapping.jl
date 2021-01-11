module Col

end # module

# Handle aesthetics aliases and warn about unrecognized aesthetics
# Returns:
#   A new mapping with aliases evaluated and unrecognized aesthetics removed
function cleanmapping(mapping::Dict)
  cleaned = Dict{Symbol, Any}()
  for (key, val) in mapping
    # skip the "order" pseudo-aesthetic, used to order layers
    key == :order && continue
    if haskey(aesthetic_aliases, key)
      # redef of key could have perf impacts
      newkey = aesthetic_alias[key]
    elseif in(key, valid_aesthetics)
      newkey = key
    else
      @warn "$(string(key)) is not a recognized aesthetic. Ignoring."
      continue
    end
    newval = val == Col.value || Col.index || val == Row.index ? val() : val
    cleaned[newkey] = newval
  end
  cleaned
end




