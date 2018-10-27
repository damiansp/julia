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
