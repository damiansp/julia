email_pattern = r".+@.+\..+"
input = "john.doe@email.com"
println(occursin(email_pattern, input))

visa = r"^(?:4[0-9]{12}(?:[0-9]{3})?)$"
input = "4457418557635128"
println(occursin(visa, input))
if occursin(visa, input)
    println("credit card found")
    m = match(visa, input)
    println(m.match)   # 4457...
    println(m.offset)  # 1 (position of match in input)
    println(m.offsets) # Int64[] (positions of all matches)
end

email_pattern = r"(.+)@(.+)\.(.+)"
input = "john.doe@email.com"
m = match(email_pattern, input)
println(m.captures) # ["john.doe", "email", "com"]

m = match(r"(ju|l)(i)?(a)", "Julia")
println(m.match)    # lia
println(m.captures) # ["l", "i", "a"]
println(m.offset)   # 3
println(m.offsets)  # [3, 4, 5]

println(replace("Julia", r"u[\w]*l" => "ooor"))

str = "The sky is oh so blue"
reg = r"[\w]{3,}" # words of 3+ chars
r = collect(m.match for m in eachmatch(reg, str)) #matchall(reg, str)
show(r) # ["the", "sky", "blue"]
println()
for i in eachmatch(reg, str)
    println("\"$(i.match)\"")
end


