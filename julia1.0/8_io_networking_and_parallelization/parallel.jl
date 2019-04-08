# start REPL with n workers (separate processes not threads; i.e., do not share
# memory)
# julia -p n    

println(workers())

#for pid in workers()
  # do whatever with each process
#end

addprocs(5)
println(nprocs())
rmprocs(3) # remove process with pid = 3
println(nprocs())

# To activate workers on a cluster:
# julia --machine-file machines driver.jl


# Have worker 2 execute 1000^2
r1 = remotecall(x -> x^2, 2, 1000)
println(fetch(r1)) # 10000000

remotecall_feth(sin, 5, 2pi)


r2 = @spawnat 4 sqrt(2) # has worker 4 calcualte sqrt(2)
fetch(r2)

r = [@spawnat w sqrt(5) for w in workers()]
fetch(r[3])

@everywhere println(myid())

# Workers correspond to different processes and hence don't share vars
x = 5
#@everywhere println(x) # throws UndefVarError: x not defined

@everywhere x = 5
@everywere println(x)

@everywhere include("defs.jl")

@everywhere function fib(n)
  if (n < 2)
    return n
  else
    return fib(n - 1) + fib(n - 2)
  end
end

include("functions.jl") # makes available to all workers

# broadcast a variable "d"
for pid in workers()
  remotecall(pid,
             x -> (global d
                   d = x
                   nothing),
             d)
end



# Parallel loops and maps
