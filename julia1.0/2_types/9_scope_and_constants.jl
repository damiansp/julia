x = 1.0 # x is Float64
x = 1   # x is Int
#y::Float64 = 1.0 # Error - type declaration on global vars not yet supported

x = begin
  a = 5
  2 * a
end
println(a) # 5
println(x) # 10


const G = 6.67e-11 # gravitational const
