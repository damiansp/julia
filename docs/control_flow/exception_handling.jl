# defining exceptions
struct MyCustomException <: Exception end



# throw
f(x) = x >= 0 ? exp(-x) : throw(DomainError(x, "argument must be nonnegative"))
println(f(1))
#println(f(-1))


struct MyUndefVarError <: Exception
  var::Symbol
end

Base.showerror(io::IO, e::MyUndefVarError) = print(io, e.var, " not defined")



# Errors
fussy_sqrt(x) = x >= 0 ? sqrt(x) : error("negative values not allowed")
println(fussy_sqrt(2))
#println(fussy_sqrt(-2)) # throws error


function verbose_fussy_sqrt(x)
  println("before fussy")
  r = fussy_sqrt(x)
  println("after fussy")
end

verbose_fussy_sqrt(2)
#verbose_fussy_sqrt(-2) # prints before then throws error



# try/catch
f(x) = try
  sqrt(x)
catch
  sqrt(complex(x, 0))
end


println(f(2))  # 1.4142...
println(f(-2)) # 0.0 + 1.4142...im


sqrt_second(x) = try
  sqrt(x[2])
catch y
  if isa(y, DomainError) sqrt(complex(x[2], 0))
  elseif isa(y, BoundsError) sqrt(x) end
end

println(sqrt_second([1, 4])) # 2.0
println(sqrt_second([1 -4])) # 0.0 + 2.0im
println(sqrt_second(9))      # 3.0
#println(sqrt_second(-9))    # DomainError

