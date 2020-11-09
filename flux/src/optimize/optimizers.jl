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

ADAM(eta=0.001, beta=(0.0, 0.999)) = ADAM(eta, beta, IdDict())


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
  ... # continue here
end

