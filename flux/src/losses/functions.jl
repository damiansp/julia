"""
  mae(yhat, y; agg=mean)
Return the mean absolute error.
"""
mae(yhat, y; agg=mean) = agg(abs.(yhat .- y))


"""
  mse(yhat, y; agg=mean)
Return the mean squared error.
"""
mse(yhat, y; agg=mean) = agg((yhat .- y).^2)


"""
  msle(yhat, y; agg=mean, epsilon=eps(yhat))
Return the mean squared log error.
`epsilon` provides numerical stability. Penalizes under-estimates more than 
over.
"""
msle(yhat, y; agg=mean, epsilon=eps(yhat)) = agg(
  (log.((yhat .+ epsilon) ./ (y .+ epsilon))).^2)


"""
  huber_loss(yhat, y; delta=1, agg=mean)
Return the Huber loss:
                | 0.5 * |yhat - y|^2,               for |yhat - y| <= delta
  Huber loss =  |
                | delta * (|yhat - y| - 0.5*delta), otherwise
"""
function huber_loss(yhat, y; agg=mean, delta=ofeltype(yhat, 1))
  abs_error = abs.(yhat .- y)
  temp = Zygote.dropgrad(abs_error .< delta)
  x = ofeltype(yhat, 0.5)
  agg(
    ((abs_error.^2) .* temp) .* x .+ delta*(abs_error .- x*delta) .* (1 .- temp)
  )
end


"""
  crossentropy(ŷ, y; dims=1, ϵ=eps(ŷ), agg=mean)
Return the cross entropy between the given probability distributions;
calculated as
  agg(-sum(y .* log.(ŷ .+ ϵ); dims=dims))
Cross entropy is tipically used as a loss in multi-class classification,
in which case the labels `y` are given in a one-hot format.
`dims` specifies the dimension (or the dimensions) containing the class probabilities.
The prediction `ŷ` is supposed to sum to one across `dims`, as would be the 
case with the output of a [`softmax`](@ref) operation.
Use of [`logitcrossentropy`](@ref) is recomended over `crossentropy` for
numerical stability.
See also: [`Flux.logitcrossentropy`](@ref), [`Flux.binarycrossentropy`](@ref), [`Flux.logitbinarycrossentropy`](@ref)
"""
function crossentropy(yhat, y; dims=1, agg=mean, epsilon=epseltype(yhat))
  agg(.-sum(xlogy(y, yhat .+ epsilon); dims=dims))
end


"""
  logitcrossentropy(ŷ, y; dims=1, agg=mean)
Return the crossentropy computed after a [`Flux.logsoftmax`](@ref) operation;
calculated as
  agg(.-sum(y .* logsoftmax(ŷ; dims=dims); dims=dims))
`logitcrossentropy(ŷ, y)` is mathematically equivalent to
[`Flux.Losses.crossentropy(softmax(ŷ), y)`](@ref) but it is more numerically stable.
See also: [`Flux.Losses.crossentropy`](@ref), [`Flux.Losses.binarycrossentropy`](@ref), [`Flux.Losses.logitbinarycrossentropy`](@ref)
"""
function logitcrossentropy(yhat, y; dims=1, agg=mean)
  agg(.-sum(y .* logsoftmax(yhat; dims=dims); dims=dims))
end


"""
  binarycrossentropy(ŷ, y; agg=mean, ϵ=eps(ŷ))
Return the binary cross-entropy loss, computed as
  agg(@.(-y*log(ŷ + ϵ) - (1-y)*log(1-ŷ + ϵ)))
The `ϵ` term provides numerical stability.
Typically, the prediction `ŷ` is given by the output of a [`sigmoid`](@ref) activation.
Use of `logitbinarycrossentropy` is recomended over `binarycrossentropy` for numerical stability.
See also: [`Flux.Losses.crossentropy`](@ref), [`Flux.Losses.logitcrossentropy`](@ref), [`Flux.Losses.logitbinarycrossentropy`](@ref)
"""
function binarycrossentropy(yhat, y; agg=mean, epsilon=epseltype(yhat))
  agg(@.(-xlogy(y, yhat + epsilon) - xlogy(1 - y, 1 - yhat + epsilon)))
end