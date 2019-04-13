function test_include()
  include("test_include.jl")
  println(some_var)
end


test_include()
