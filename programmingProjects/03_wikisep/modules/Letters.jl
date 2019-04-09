module Letters

using Random

export randstring


const MY_NAME = "Letters"


function rand_letter()
    Random.rand('A':'Z')
end

function randstring()
    [rand_letter() for _ in 1:10] |> join
end


include("module_name.jl")

end
