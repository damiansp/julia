using RDatasets
using Statistics


iris = dataset("datasets", "iris")
println("Data fields in iris:")
println(names(iris))
println("Iris size: ", size(iris))
println("Head:")
println(first(iris, 5))
println(by(iris, :Species, nrow))
println(describe(iris))
println(describe(iris, stats=[:std, :q25, :q75, :first, :last]))
println(describe(iris, stats=:all))
println(mean(iris[:SepalLength]))
println(median(iris[:SepalLength]))
println(std(iris[:SepalLength]))

for x in names(iris)[1:end - 1]
  for y in names(iris)[1:end - 1]
    println("$x\t$y\t$(cor(iris[x], iris[y]))")
  end
  println("------------------------------------")
end


          


        
