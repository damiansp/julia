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
