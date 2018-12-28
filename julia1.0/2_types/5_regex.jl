email_pattern = r".+@.+\..{2,3}$"
e1 = "john.doe@mit.edu"
e2 = "john.doe@mit.educ"

println(occursin(email_pattern, e1))
println(occursin(email_pattern, e2))

email_pattern = r"(.+)@(.+\..{2,3}$)"
m = match(email_pattern, e1)
println(m.captures) # Union{Nothing, Substring{String}}["john.doe", "mit.edu"]

m = match(r"(ju|l)(i)?(a)", "Julia")
println(m.match)    # lia
println(m.captures) # Union{Nothing, SubString{String}}["l", "i", "a"]
println(m.offset)   # 3
println(m.offsets)  # [3, 4, 5]

println(replace("Julia", r"u[\w]*l" => "o")) # Joia

str = "The sky is a blue hue, eh"
reg = r"[\w]{3,}"
r = collect((m.match for m = eachmatch(reg, str)))
show(r) # SubString{String}["The", "sky", "blue", "hue"]

iter = eachmatch(reg, str)
for i in iter
    println("\"$(i.match)\"")
end


