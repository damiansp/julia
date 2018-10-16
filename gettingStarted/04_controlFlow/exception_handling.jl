codes = ["IL", "MI", "VA", "CA", "AK", "CO", "OR"]
code = "OR"

if code in codes
    println("code accepted")
else
    throw(DomainError())
end

@warn("Strange things are afoot")
@info("A handy tip!")


a = []

try
    pop!(a)
catch ex
    println(typeof(ex))
    showerror(stdout, ex)
    println()
end


try
    pop!(a)
catch ex
    if isa(ex, DomainError)
        println("Domain error")
    elseif isa(ex, BoundsError)
        println("Bounds error")
    elseif isa(ex, ArgumentError)
        println("Argument error")
    else
        showerror(stdout, ex)
        println()
    end
end
