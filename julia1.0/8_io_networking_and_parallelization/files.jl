println(fieldnames(IOStream)) # (:handle, :ios, :name, :mark)
println(IOStream.types)
# (Ptr{Nothing}, Array{UInt8,1}, AbstractString, Int64)

fname = "example.dat"
f1 = open(fname)
data = readlines(f1)
for line in data
  println(line)
end
close(f1)


open(fname) do file
  for line in eachline(file)
    println(line)
  end
end


