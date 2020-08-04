include("./Vehicle.jl")
import .Vehicle: poweron!, poweroff!, turn!, move!, getposition


"FighterJet is a very fast vehicle with powerful weapons"
mutable struct FighterJet
  "power status: true = on; false = off"
  power::Bool
  "current direction in radians from due west"
  direction::Float64
  "current position coordinates (x, y)"
  position::Tuple{Float64, Float64}
end

function poweron!(fj::FighterJet)
  fj.power = true
  println("Powered on: ", fj)
  nothing
end

function poweroff!(fj::FighterJet)
  fj.power = false
  println("Powered off: ", fj)
  nothing
end

function turn!(fj::FighterJet, direction)
  fj.direction = direction
  println("Changed direction to ", direction, ": ", fj)
  nothing
end

function move!(fj::FighterJet, distance)
  x, y = fj.position
  dx = round(distance * cos(fj.direction), digits=2)
  dy = round(distance * sin(fj.direction), digits=2)
  fj.position = (x + dx, y + dy)
  println("Moved (", dx, ", ", dy, "): ", fj)
  nothing
end

function getposition(fj::FighterJet)
  fj.position
end


#------
fj = FighterJet(false, 0, (0, 0))
poweron!(fj)
move!(fj, 13)
turn!(fj, 1.2)
move!(fj, 10)
poweroff!(fj)