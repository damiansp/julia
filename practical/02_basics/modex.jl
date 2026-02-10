module M1

export plusone

plusone(x) = x + 1

end


module M2

export minusone

minusone(x) = x - 1

end


using .M1, .M2


println(plusone(99))
println(minusone(101))
