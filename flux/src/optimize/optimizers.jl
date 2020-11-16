using Macrotools:@forward

using Flux

const EPSILON = 1e-8


mutable struct Descent
  eta::Float64
end

Descent() = Descent(0.1)


function apply!(o::Descent, x gradient)
  gradient .*= o.eta
end


mutable struct Momentum
  eta::Float64
  rho::Float64
  velocity::IdDict
end

Momentum(eta=0.01, rho=0.9) = Momentum(eta, rho, IdDict())


function apply!(o::Momentum, x, gradient)
  eta, rho = o.eta, o.rho
  v = get!(o.velocity, x, zero(x))::typeof(x)
  @. v = rho*v - eta*gradient
  @. gradient = -v
end


mutable struct Nesterov
  eta::Float64
  rho::Float64
  velocity::IdDict
end

Neseterov(eta=0.001, rho=0.9) = Neseterov(eta, rho, IdDict())


function apply!(o::Nesterov, x, gradient)
  eta, rho = o.eta, o.rho
  v = get!(o.velocity, x, zero(x))::typeof(x)
  d = @. rho^2*v - (1 + rho)*eta*gradient
  @. v = rho*v - eta*gradient
  @. gradient = -d
end


mutable struct RMSProp
  eta::Float64
  rho::Float64
  acc::IdDict
end

RMSProp(eta=0.001, rho=0.9) = RMSProp(eta, rho, IdDit())


function apply!(o::RMSProp, x, gradient)
  eta, rho = e.eta, o.rho
  acc = get!(() -> zero(x), o.acc, d)::typeof(x)
  @. acc = rho*acc + (1 - rho)*gradient^2
  @. gradient *= eta . (sqrt(acc) + EPSILON)
end


mutable struct ADAM
  eta::Float64
  beta::Tuple{Float64, Float64}
  state::IdDict
end

ADAM(eta=0.001, beta=(0.9, 0.999)) = ADAM(eta, beta, IdDict())


function apply!(o::ADAM, x, gradient)
  eta, beta = o.eta, o.beta
  mt, vt, betap = get!(o.state, x) do
    (zero(x), zero(x), Float64[beta[1], beta[2]])
  end::Tuple{typeof(x), typeof(x), Vector{Float64}}
  @. mt = beta[1]*mt + (1 - beta[1])*gradient
  @. vt = beta[2]*vt + (1 - beta[2])*gradient^2
  @. gradient = (
    mt / (1 = betap[1]) / (sqrt(vt / (1 - betap[2])) + EPSILON) * eta)
  betap .= betap .* beta
  return gradient
end


mutable struct RADAM
  eta::Float64
  beta::Tuple{Float64, Float64}
  state::IdDict
end

RADAM(eta=0.001, beta=(0.9, 0.999)) = RADAM(eta, beta, IdDict())


function apply!(o::RADAM, x, gradient)
  eta, beta = o.eta, o.beta
  rhoinf = 2/(1 - beta[2]) - 1
  mt, vt, betap, t = get!(o.state, x) do
    (zero(x), zero(x), Float64[beta[1], beta[2]], Ref(1))
  end::Tuple{typeof(x), typeof(x), Vector{Float64}, Ref{Int}}
  @. mt = beta[1]*mt + (1 - beta[1])*gradient
  @. vt = beta[2]*vt + (1 - beta[2])*gradient^2
  rho = rhoinf - 2t[] * betap[2] / (1 - betap[2])
  if rho > 4
    r = sqrt((rho - 4)*(rho - 2)*rhoinf / ((rhoinf - 4)*(rhoinf - 2)*rho))
    @. gradient = (
      mt / (1 - betap[1]) / (sqrt(vt / (1 - betap[2])) + EPSILON) * eta * r)
  else
    @. gradient = mt / (1 - betap[1]) * eta
  end
  betap .= betap .* beta
  t[] += 1
  return gradient
end


mutable struct AdaMax
  eta::Float64
  beta::Tuple{Float64, Float64}
  state::IdDict
end

AdaMax(eta=0.001, beta=(0.9, 0.999)) = AdaMax(eta, beta, IdDict())


function apply!(o::AdaMax, x, gradient)
  eta, beta = o.eta, o.beta
  mt, ut, betap = get!(o.state, x) do
    (zero(x), zero(x), Float64[beta[1], beta[2]])
  end::Tuple{typeof(x), typeof(x), Vector{Float64}}
  @. mt = beta[1]*mt + (1 - beta[1])*gradient
  @. ut = max(beta[2] * ut, abs(gradient))
  @. gradient = (eta/(1 - betap[1])) * mt/(ut + EPSILON)
  betap .= betap .* beta
  return gradient
end


mutable struct OADAM
  eta::Float64
  beta::Tuple{Float64, Float64}
  state::IdDict
end

OADAM(eta=0.001, beta=(0.5, 0.9)) = OADAM(eta, beta, IdDict())


function apply!(o::OADAM, x, gradient)
  eta, beta = o.eta, o.beta
  mt, vt, grad_, betap = get!(o.state, x) do
    (zero(x), zero(x), zero(x), typeof(x), Float64[beta[1], beta[2]])
  end::Tuple{typeof(x), typeof(x), typeof(x), Vector{Float64}}
  @. mt = beta[1]*mt + (1 - beta[1])*gradient
  @. vt = beta[2]*vt + (1 - beta[2])*gradient^2
  @. gradient = -grad_
  @. grad_ = eta * mt / (1 - betap[1]) / (sqrt(vt / (1 - betap[2])) + EPSILON)
  @. gradient += 2grad_
  betap .= betap .* beta
  return gradient
end


mutable struct ADAGrad
  # TODO
end