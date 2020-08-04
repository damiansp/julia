using Test

module Foo
foo(x, y) = 1
foo(x::Integer, y) = 2
foo(x, y::Integer) = 3
end # module

println("\n\nChecking Foo for detect_ambiguities")
println(detect_ambiguities(Main.Foo))


module Bar
bar(x, y) = 1
bar(x::Integer, y) = 2
bar(x, y::Integer) = 3
bar(x::Integer, y::Integer) = 4
end # module

println("\n\nChecking Bar for detect_ambiguities")
println(detect_ambiguities(Main.Bar))