using Macrotools:@forward

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
  
end