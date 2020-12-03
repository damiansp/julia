using Juno

import Zygote: Params, gradient


"""
  update!(x, xbar)
Update array `x` by elementwise subtraction of `xbar`
"""
function update!(x::AbstractArray, xbar)
  x .-= xbar
end


"""
  update!(opt, p, g)
  update!(opt, ps::Params, gs)
Perform an update step of parameters `p` or `ps` according to optimizer `opt` 
and gradients `g` or `gs`. As a result params are mutated and optimizer's 
state may change.
"""
function update!(opt, x, xbar)
  x .-= apply!(opt, x, xbar)
end

function update!(opt, xs::Parapms, gs)
  for x in xs
    gs[x] == nothing && continue
    update!(opt, x, gs[x])
  end
end


# Callback niceties
call(f, xs...) = f(xs...)
runall(f) = f
runall(fs::AbstractVector) = () -> foreach(call, fs)


struct SkipException <: Exception end


"""
  skip()
Call `Flux.skip()` in a callback to indicate when a callback condition is met.
This will trigger the train loop to skip the current data point and not update
with the calculated gradient.
"""
function skip()
  throw(SkipException())
end

