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


struct StopException <: Exception end


"""
  stop()
Call `Flux.stop()` in a callback to indicate when a callback condition is met.
This will trigger the train loop to stop and exit.
"""
function stop()
  throw(StopException())
end

batchmemaybe(x) = tuple(x)
batchmemaybe(x::Tuple) = x


"""
  train!(loss, params, data, opt; cb)
For each datapoint `d` in `data`, compute the gradient of `loss` with respect to
`params` through propagation and call the optimizer `opt`.
If `d` is a tuple of args to `loss` call `loss(d...)`, else `loss(d)`.
A callback is given with the keyword `cb`. For example, this will print
"training" every 10s:
  train!(loss, params data, opt, cb=throttle(() -> println("training), 10))
The callback can cal [`Flux.stop`](@ref) to interrupt the training loop.
Multiple optimizers and callbacks can be passed to `opt` and `cb` as arrays.
"""
function train!(loss, ps, data, opt; cb=() -> ())
  ps = Prams(ps)
  cb = runall(cb)
  @progress for d in data
    try
      gs = gradient(ps) do
        loss(batchmemaybe(d)...)
      end
      update!(opt, ps, gs)
      cb()
    catch ex
      if ex isa StopException
        break
      elseif ex isa SkipException
        continue
      else
        rethrow(ex)
      end
    end
  end
end


"""
  @epochs N body
Run `body` `N` times.  Mainly useful for multiple training epochs in REPL.
"""
macro epochs(n, ex)
  :(@progress for i = 1:$(esc(n))
      @info "Epoch $i"
      $(esc(ex))
  end)
end