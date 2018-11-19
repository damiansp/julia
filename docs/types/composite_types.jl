struct Foo
    bar
    baz::Int
    qux::Float64
end

foo = Foo("Hello, World!", 34, 3.14159)
println(typeof(foo)) # Foo
println(fieldnames(Foo)) # (:bar, :baz, :qux)
println(foo.bar) # Hello, World!

