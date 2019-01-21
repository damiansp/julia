println([x += 1 for x = 1:5]) # 2 3 4 5 6
println(Float64[x += 1 for x in 1:5]) # 2. 3. 4. 5. 6.
println([x += y for x = 1:5, y = 11:15])
println([x += 1 for x in 1:30 if x % 3 == 0]) # 4 7 10... 31

