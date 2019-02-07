using Cairo
using Gadfly
using RDatasets
using Statistics


# Simple Stats
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

println("5 random sepal lengths: ", rand(iris[:SepalLength], 5))

sepal_lengths = Array(iris[:SepalLength])
println(sepal_lengths)

iris_array = convert(Matrix, iris)
          


# Visualization
p = plot(iris, x=:SepalLength, y=:PetalLength, color=:Species)
draw(PNG("irisScatter.png", 4inch, 4inch), p)

p = plot(iris, x=:Species, y=:PetalLength, Geom.boxplot)
draw(PNG("irisBox.png", 4inch, 4inch), p)

p = plot(iris, x=:PetalLength, color=:Species, Geom.histogram)
draw(PNG("irisHist.png", 4inch, 4inch), p)

p = plot(iris, x=:PetalWidth, color=:Species, Geom.histogram)
draw(PNG("irisHist2.png", 4inch, 4inch), p)

p = plot(iris, x=:PetalWidth, y=:PetalLength, color=:Species)
draw(PNG("irisScatter2.png", 4inch, 4inch), p)


