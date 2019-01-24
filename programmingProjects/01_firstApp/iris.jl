using RDatasets


iris = dataset("datasets", "iris")
println("Data fields in iris:")
println(names(iris))
println("Iris size: ", size(iris))
println("Head:")
println(head(iris))
println(by(iris, :Species, nrow))

