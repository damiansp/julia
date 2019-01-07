using Statistics


x = 1.0 # x is Float64
x = 1   # x is Int
#y::Float64 = 1.0 # Error - type declaration on global vars not yet supported

x = begin
  a = 5
  2 * a
end
println(a) # 5
println(x) # 10


const G = 6.67e-11 # gravitational const
const ARR = [4, 7, 1]
ARR[1] = 8 # OK
#ARR = [2, 2, 2] # Error

str = "The Gold and Blue Loses a Bit of Its Luster"
println(str)
nchars = length(str)
println("The headline contains $nchars chars")
str2 = replace(str, "Blue" => "Red")

println(str)
println(str2)
println("Here are chars 25:30:")
subs = str[25:30]
print("-$(lowercase(subs))-")
println("Here are all the chars:")
for c in str
    print(c, " ")
end

arr = split(str, ' ')
show(arr)

nwords = length(arr)
println("The headline contains $nwords words:")
for word in arr
    println(word)
end

arr[4] = "Silver"
show(arr)
println("Back to sentence...")
nstr = join(arr, ' ')
println(nstr)

println("arrays: sum, mean, sd")
arr = collect(1:100)
println(typeof(arr))
println(sum(arr))
println(mean(arr))
println(std(arr))
