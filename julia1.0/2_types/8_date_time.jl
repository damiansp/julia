using Dates

start_time = time() # epoch time
println(start_time) # 1.546819846723548e9
elapsed = time() - start_time
println("Elapsed time: $elapsed") # 0.07457613945007324

d = Date(2014, 9, 1)
println(d)         # 2014-09-01
println(typeof(d)) # Date

dt = DateTime(2014, 9, 1, 12, 30, 59, 1) 
println(dt)         # 2014-09-01T12:30:59.001
println(typeof(dt)) # DateTime

println(year(d))        # 2014
println(month(d))       # 9
println(week(d))        # 36
println(day(d))         # 1
println(dayofweek(d))   # 1
println(dayname(d))     # Monday
println(daysinmonth(d)) # 30
println(dayofyear(d))   # 244
println(isleapyear(d))  # false












