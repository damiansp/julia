module M1

export plusone

"""
    plusone(x)

Add _one_ to the **number** `x`.

# Example

For example, `plusone(1)` returns 2.
"""
plusone(x) = x + 1


module M2

export minusone

minusone(x) = x - 1

using ..M1

println(plusone(200))

end


end


using .M1, .M1.M2


println(plusone(99))
println(minusone(201))
