using CSV
using Feather
using RDatasets


iris = dataset("datasets", "iris")

test_data = iris[rand(150) .<= 0.1, [:PetalLength, :PetalWidth, :Species]]
println(test_data)

CSV.write("iris_test_data.csv", test_data)
test = CSV.read("iris_test_data.csv")
println(test)


# Feather files (binary format for dataframes)
Feather.write("iris_test_data.feather", test_data)
test = Feather.read("iris_test_data.feather")
println(test)
