using Flux
using Flux: train!


actual(x) = 4x + 2
xtrain, xtest = hcat(0:5...), hcat(6:10...)
ytrain, ytest = actual.(xtrain), actual.(xtest)

mod = Dense(1, 1)
println(mod.weight, mod.bias)

predict = Dense(1, 1)
preds = predict(xtrain)

getloss(x, y) = Flux.Losses.mse(predict(x), y)
err = getloss(xtrain, ytrain)
println(err)

opt = Descent()
data = [(xtrain, ytrain)]

println("Initial W, b:")
println(predict.weight)
println(predict.bias)

parameters = params(predict)
println(parameters)

train!(getloss, parameters, data, opt)
println("After one round of training: loss")
println(getloss(xtrain, ytrain))
println("Optimized params:")
println(parameters)

for epoch in 1:100
  train!(getloss, parameters, data, opt)
end
println("After 100 more epochs.  loss:")
println(getloss(xtrain, ytrain))
println("Params:")
println(parameters)

print("predictions:")
println(predict(xtest))
println("actual:")
println(ytest)
println("Test err:")
testerr = getloss(xtest, ytest)
println(testerr)
