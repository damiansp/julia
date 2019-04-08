using Distributed
using LinearAlgebra


function buffon(n)
    hit = 0
    for i = 1:n
        mp = rand()
        phi = (rand() * pi) - pi/2 # needle angle
        xright = mp + cos(phi)/2   # x coord of needle ends
        xleft = mp - cos(phi)/2
        # Needle intersect x == 0 or x == 1?
        p = (xright >= 1 || xleft <= 0) ? 1 : 0
        hit += p
    end
    miss = n - hit
    pi_approx = n / hit * 2
end


function buffon_par(n)
    hit = @distributed (+) for i = 1:n
        mp = rand()
        phi = (rand() * pi) - pi/2
        xright = mp + cos(phi)/2
        xleft = mp - cos(phi)/2
        (xright >= 1 || xleft <= 0) ? 1 : 0
    end
    miss = n - hit
    pi_approx = n / hit * 2
end


println(@time buffon(100000))
println(@time buffon(100000000))

println(@time buffon_par(100000))
println(@time buffon_par(100000000))


function rank_marray()
    marr = [rand(1000, 1000) for i = 1:10]
    for arr in marr
        println(LinearAlgebra.rank(arr))
    end
end


function prank_marray()
    marr = [rand(1000, 1000) for i = 1:10]
    println(pmap(LinearAlgebra.rank, marr))
end

show(@time rank_marray())
show(@time prank_marray())



