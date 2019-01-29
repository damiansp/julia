# like yield expressions in python
function fib_producer(c::Channel)
    a, b = (0, 1)
    for i = 1:5
        put!(c, b)        # put b into channel c
        a, b = (b, a + b) # update a and b
    end
end

chnl = Channel(fib_producer)
println(take!(chnl)) # 1
println(take!(chnl)) # 1
println(take!(chnl)) # 2
println(take!(chnl)) # 3
println(take!(chnl)) # 5
#println(take!(chnl)) # LoadError: InvalidStateException("Channel is closed.",
#                                                        :closed)

chnl = Channel(fib_producer)
for n in chnl println(n) end

#chnl = @task fib_producer(c::Channel) # ?
#println(take!(chnl))


fac(i::Integer) = (i > 1) ? i*fac(i - 1) : 1
c = Channel(0)
task = @async foreach(i -> put!(c, fac(i)), 1:5)
bind(c, task)
for i in c
    @show i
end
