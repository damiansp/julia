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


fname = "example2.dat"
f2 = open(fname, "w")
write(f2, "This gets written to the file, $fname.\n")
println(f2, "Using println() does the same thing.")
println(f2, "...and terminates in a new line.")
close(f2)

mydir = pwd()
cd("..")

for file_name in readdir()
  println(file_name)
end
cd(mydir)
