using Plots

Base.@kwdef mutable struct Attractor
  dt::Float64 = 0.02
  sig::Float64 = 10
  rho::Float64 = 28
  beta::Float64 = 8/3
  x::Float64 = 1
  y::Float64 = 1
  z::Float64 = 1
end


function step!(a::Attractor)
  dx = a.sig * (a.y - a.x)
  a.x += a.dt * dx
  dy = a.x*(a.rho - a.z) - a.y
  a.y += a.dt * dy
  dz = a.x*a.y - a.beta*a.z
  a.z += a.dt * dz
end

attractor = Attractor()

plt = plot3d(1, 
             xlim=(-30, 30), 
             ylim=(-30, 30), 
             zlim=(0, 60), 
             title="Lorenz Attractor", 
             marker=2)

# Build animated gif by pushing new pints to plot, save every 10th frame
@gif for i=1:5000
  step!(attractor)
  push!(plt, attractor.x, attractor.y, attractor.z)
end every 10