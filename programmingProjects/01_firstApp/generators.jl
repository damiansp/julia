println(x += 1 for x = 1:10) # Base.Generator{UnitRange{Int64}...

@time for i in [x^3 for x = 1:1_000_000]
    i >= 1000 && break
    println(i)
end # 0.028050s, 10.492 MiB

# with a generator:
@time for i in (x^3 for x = 1:1_000_000)
    i >= 1000 && break
    println(i)
end # 0.013343s, 898.070 KiB


