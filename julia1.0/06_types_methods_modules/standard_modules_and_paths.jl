module Package1
export Type1, perc

include("file1.jl") # not a module; same as pasting the contents of file1 here
include("file2.jl")


mutable struct Type1
    total
end


perc(a::Type1) = a.total * 0.01

end


# Namespace conflicts:
#import Winston
#import Gadfly
#Winston.plot(rand(4))
#Gadfly.plot(x=[1:10], y=rand(10))

