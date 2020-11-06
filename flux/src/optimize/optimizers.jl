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

