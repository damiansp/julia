using MacroTools:@forward

using Flux

const EPSILON = 1e-8


mutable struct Descent
  eta::Float64
end

Descent() = Descent(0.1)


function apply!(o::Descent, x delta)
  delta .*= o.eta
end


mutable struct Momentum
  eta::Float64
  rho::Float64
  velocity::IdDict
end

Momentum(eta=0.01, rho=0.9) = Momentum(eta, rho, IdDict())


function apply!(o::Momentum, x, delta)
  eta, rho = o.eta, o.rho
  v = get!(o.velocity, x, zero(x))::typeof(x)
  @. v = rho*v - eta*delta
  @. delta = -v
end


mutable struct Nesterov
  eta::Float64
  rho::Float64
  velocity::IdDict
end

Neseterov(eta=0.001, rho=0.9) = Neseterov(eta, rho, IdDict())


function apply!(o::Nesterov, x, delta)
  eta, rho = o.eta, o.rho
  v = get!(o.velocity, x, zero(x))::typeof(x)
  d = @. rho^2*v - (1 + rho)*eta*delta
  @. v = rho*v - eta*delta
  @. delta = -d
end


mutable struct RMSProp
  eta::Float64
  rho::Float64
  acc::IdDict
end

RMSProp(eta=0.001, rho=0.9) = RMSProp(eta, rho, IdDit())


function apply!(o::RMSProp, x, delta)
  eta, rho = e.eta, o.rho
  acc = get!(() -> zero(x), o.acc, d)::typeof(x)
  @. acc = rho*acc + (1 - rho)*delta^2
  @. delta *= eta . (sqrt(acc) + EPSILON)
end


mutable struct ADAM
  eta::Float64
  beta::Tuple{Float64, Float64}
  state::IdDict
end

ADAM(eta=0.001, beta=(0.9, 0.999)) = ADAM(eta, beta, IdDict())


function apply!(o::ADAM, x, delta)
  eta, beta = o.eta, o.beta
  mt, vt, betap = get!(o.state, x) do
    (zero(x), zero(x), Float64[beta[1], beta[2]])
  end::Tuple{typeof(x), typeof(x), Vector{Float64}}
  @. mt = beta[1]*mt + (1 - beta[1])*delta
  @. vt = beta[2]*vt + (1 - beta[2])*delta^2
  @. delta = (
    mt / (1 = betap[1]) / (sqrt(vt / (1 - betap[2])) + EPSILON) * eta)
  betap .= betap .* beta
  return delta
end


mutable struct RADAM
  eta::Float64
  beta::Tuple{Float64, Float64}
  state::IdDict
end

RADAM(eta=0.001, beta=(0.9, 0.999)) = RADAM(eta, beta, IdDict())


function apply!(o::RADAM, x, delta)
  eta, beta = o.eta, o.beta
  rhoinf = 2/(1 - beta[2]) - 1
  mt, vt, betap, t = get!(o.state, x) do
    (zero(x), zero(x), Float64[beta[1], beta[2]], Ref(1))
  end::Tuple{typeof(x), typeof(x), Vector{Float64}, Ref{Int}}
  @. mt = beta[1]*mt + (1 - beta[1])*delta
  @. vt = beta[2]*vt + (1 - beta[2])*delta^2
  rho = rhoinf - 2t[] * betap[2] / (1 - betap[2])
  if rho > 4
    r = sqrt((rho - 4)*(rho - 2)*rhoinf / ((rhoinf - 4)*(rhoinf - 2)*rho))
    @. delta = (
      mt / (1 - betap[1]) / (sqrt(vt / (1 - betap[2])) + EPSILON) * eta * r)
  else
    @. delta = mt / (1 - betap[1]) * eta
  end
  betap .= betap .* beta
  t[] += 1
  return delta
end


mutable struct AdaMax
  eta::Float64
  beta::Tuple{Float64, Float64}
  state::IdDict
end

AdaMax(eta=0.001, beta=(0.9, 0.999)) = AdaMax(eta, beta, IdDict())


function apply!(o::AdaMax, x, delta)
  eta, beta = o.eta, o.beta
  mt, ut, betap = get!(o.state, x) do
    (zero(x), zero(x), Float64[beta[1], beta[2]])
  end::Tuple{typeof(x), typeof(x), Vector{Float64}}
  @. mt = beta[1]*mt + (1 - beta[1])*delta
  @. ut = max(beta[2] * ut, abs(delta))
  @. delta = (eta/(1 - betap[1])) * mt/(ut + EPSILON)
  betap .= betap .* beta
  return delta
end


mutable struct OADAM
  eta::Float64
  beta::Tuple{Float64, Float64}
  state::IdDict
end

OADAM(eta=0.001, beta=(0.5, 0.9)) = OADAM(eta, beta, IdDict())


function apply!(o::OADAM, x, delta)
  eta, beta = o.eta, o.beta
  mt, vt, delta_, betap = get!(o.state, x) do
    (zero(x), zero(x), zero(x), typeof(x), Float64[beta[1], beta[2]])
  end::Tuple{typeof(x), typeof(x), typeof(x), Vector{Float64}}
  @. mt = beta[1]*mt + (1 - beta[1])*delta
  @. vt = beta[2]*vt + (1 - beta[2])*delta^2
  @. delta = -delta_
  @. delta_ = eta * mt / (1 - betap[1]) / (sqrt(vt / (1 - betap[2])) + EPSILON)
  @. delta += 2delta_
  betap .= betap .* beta
  return delta
end


mutable struct ADAGrad
  eta::Float64
  acc::IdDict
end

ADAGrad(eta=0.1) = ADAGrad(eta, IdDict())


function apply!(o::ADAGrad, x, delta)
  eta = o.eta
  acc = get!(() -> fill!(similar(x), EPSILON), o.acc, x)::typeof(x)
  @. acc += delta^2
  @. delta *= eta / (sqrt(acc) + EPSILON)
end


mutable struct ADADelta
  rho::Float64
  state::IdDict
end

ADADelta(rho=0.9) = ADADelta(rho, IdDict())


function apply!(o::ADADelta, x, delta)
  rho = o.rho
  acc, delta_acc = get!(
    () -> (zero(x), zero(x)), o.state, x
  )::NTuple{2, typeof(x)}
  @. acc = rho*acc + (1 - rho)*delta^2
  @. delta *= sqrt(delta_acc + EPSILON) / sqrt(acc + EPSILON)
  @. delta_acc = rho*delta_acc + (1 - rho)*delta^2
  return delta
end


mutable struct AMSGrad
  eta::Float64
  beta::Tuple{Float64, Float64}
  state::IdDict
end

AMSGrad(eta=0.001, beta=(0.9, 0.999)) = AMSGrad(eta, beta, IdDict())


function apply!(o::AMSGrad, x, delta)
  eta, beta = o.eta, o.beta
  mt, vt, vhatt = get!(o.state, x) do
    (fill!(similar(x), EPSILON), 
     fill!(similar(x), EPSILON), 
     fill!(similar(x), EPSILON))::NTuple{3, typeof(x)}
  end
  @. mt = beta[1]*mt + (1 - beta[1])*delta
  @. vt = beta[2]*vt + (1 - beta[2])*delta^2
  @. vhatt = max(vhatt, vt)
  @. delta = eta*mt / (sqrt(vhatt + EPSILON))
end


mutable struct NADAM
  eta::Float64
  beta::Tuple{Float64, Float64}
  state::IdDict
end

NADAM(eta=0.001, beta=(0.9, 0.999)) = NADAM(eta, beta, IdDict())


function apply!(o::NADAM, x, delta)
  eta, beta = o.eta, o.beta
  mt, vt, betap = get!(o.state, x) do
    (zero(x), zero(x), Float64[o.beta[1], o.beta[2]])
  end::Tuple{typeof(x), typeof(x), Vector{Float64}}
  beta1p, beta2p = betap
  @. mt = beta[1]*mt + (1 - beta[1])*delta
  @. vt = beta[2]*vt + (1 - beta[2])*delta^2
  @. delta = (
    (beta[1]*mt / (1 - beta[1]*beta1p) + (1 - beta[1])*delta / (1 - beta1p)) 
    / (sqrt(vt * beta[2] / (1 - beta2p)) + EPSILON) 
    * eta)
  betap .= betap .* beta
  return delta
end


ADAMW(eta=0.001, beta=(0.9, 0.999), decay=0) = Optimizer(ADAM(eta, beta),       
                                                         WeightDecay(decay))


mutable struct AdaBelief
  eta::Float64
  beta::Tuple{Float64, Float64}
  state::IdDict
end

AdaBelief(eta=0.001, beta=(0.9, 0.999)) = AdaBelief(eta, beta, IdDict())


function apply!(o::AdaBelief, x, delta)
  eta, beta = o.eta, o.beta
  mt, st = get!(() -> (zero(x), zero(x)), o.state, x)::NTuple{2, typeof(x)}
  @. mt = beta[1]*mt + (1 - beta[1])*delta
  @. st = beta[2]*st + (1 - beta[2])*(delta - mt)^2
  @. delta = eta * mt / (sqrt(st) + EPSILON)
  return delta
end


# Compose Optimizers
"""
    Optimizer(a, b, c...)
Combine several optimizers into one.  Each optimizer produces a modified 
gradient that will be fed into the next, and this is finally applies to the 
param as usual.
"""
mutable struct Optimizer
  os::Vector{Any}
end

Optimizer(o...) = Optimizer(Any[o...])
Optimiser(o...) = Optimizer(Any[o...])

@forward Optimizer.os Base.getindex, Base.first, Base.last, Base.lastindex, 
  Base.push!, Base.setindex!
@forward Optimizer.os.Base.iterate

Base.getindex(c::Optimizer, i::AbstractArray) = Optimizer(c.os[i]...)


function apply!(o::Optimizer, x, delta)
  for opt in o.os 
    delta = apply!(opt, x, delta)
  end
  delta
end


"""
    InvDecay(gamma=0.001)
Apply inverse time decay to an Optimizer so that the effective time step size
at iteration `n` is `eta / (1 + gamma*n)` where `eta` is the inital step size.
The wrapped Optimizer's step size is not modified.
"""
mutable struct InvDecay
  gamma::Float64
  state::IdDict
end

InvDecay(gamma=0.001) = InvDecay(gamma, IdDict())


function apply!(o::InvDecay, x, delta)
  gamma = o.gamma
  n = get!(o.state, x, 1)
  delta .*= 1 / (1 + gamma*n)
  o.state[x] = n + 1
  delta
end


"""
    ExpDecay(eta=0.001, decay=0.1, decay_step=1000, clip=1e-4)
Discout the learning rate `eta` by a factor `decay` every `decay_step` steps
until a minumum value of `clip` is reached.
Args:
  eta: Learning rate; amt by which gradients are discounted before updating 
    weights
  decay: Factor by which learning rate is discounted
  decay_step: Update eta every this-many iterations
  clip: Minimum value eta may take
"""
mutable struct ExpDecay
  eta::Float64
  decay::Float64
  step::Int64
  clip::Float64
  current::IdDict
end

ExpDecay(opt=0.001, decay=0.1, decay_step=1000, clip=1e-4) = ExpDecay(
  opt, decay, decay_step, clip, IdDict())


function apply!(o::ExpDecay, x, delta)
  eta, s, decay = o.eta, o.step, o.decay
  n = o.current[x] = get(o.current, x, 0) + 1
  if o.current[x] % s == 0 && count(x -> x % s == 0, values(o.current)) == 1
    eta = max(eta * decay, o.clip)
    o.eta = eta
  end
  @. delta *= eta
end


"""
    WeightDecay(wd=0)
Decay weights by a factor of wd
"""
mutable struct WeightDecay
  wd::Real
end

WeightDecay() = WeightDecay(0)


function apply!(o::WeightDecay, x, delta)
  wd = o.wd
  @. delta += wd * x
end


"""
    ClipValue(thresh)
Clip gradients when their abs val exceeds `thresh`
"""
mutable struct ClipValue{T}
  thresh::t
end

apply!(o::ClipValue, x, delta) = clamp!(delta, -o.thresh, o.thresh)


"""
    ClipNorm(thresh)
Clip gradients when their L2 norm exceeds `thresh`
"""
mutable struct ClipNorm{T}
  thresh::T
end


function apply!(o::ClipNorm, c, delta)
  deltanorm = norm(delta)
  if deltanorm > o.thresh
    rmul!(delta, o.thresh / deltanorm)
  end
  delta
end