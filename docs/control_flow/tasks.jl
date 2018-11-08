# Similar to Python generators:
function producer(c::Channel)
  put!(c, "start") # put! defines a producer task
  for n = 1:4 put!(c, 2n) end
  put!(c, "stop")
end


chn1 = Channel(producer)
println(take!(chn1)) # start
println(take!(chn1)) # 2
println(take!(chn1)) # 4
println(take!(chn1)) # 6
println(take!(chn1)) # 8
println(take!(chn1)) # stop
#println(take!(chn1)) # LoadError: InvalidStateException("Channel is closed...")


for x in Channel(producer) println(x) end


function mytask(myarg)
  # ...
end

taskHdl = Task(() -> mytask(7)) # Same as:
taskHdl = @task mytask(7)

