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
  label_smoothing(y::Union{Number, AbstractArray}, alpha; dims::Int=1)
Returns smoothed labels, meaning the confidence on label values are relaxed.
When `y` is given as one-hot vector or batch of one-hot, its calculated as
  y .* (1 - α) .+ α / size(y, dims)
when `y` is given as a number or batch of numbers for binary classification,
its calculated as
  y .* (1 - α) .+ α / 2
in which case the labels are squeezed towards `0.5`.
`alpha` is a number in interval (0, 1) called the smoothing factor. The higher the
value of `alpha`, the larger the smoothing of `y`.
`dims` denotes the one-hot dimension, unless `dims=0` which denotes the application
of label smoothing to binary distributions encoded in a single number.
"""
function label_smoothing(
    y::Union{AbstractNumber, Number}, alpha::Number; dims::Int=1)
  if !(0 < alpha < 1)
    throw(ArgumentError("alpha must be between 0 and 1"))
  end
  if dims == 0
    y_smoothed = y .* (1 - alpha) .+ alpha * 1//2
  elseif dims ==1
    y_smoothed = y .* (1 - alpha) .+ alpha * 1//size(y, 1)
  else
    throw(ArgumentError("`dims` should be either 0 or 1"))
  end
  y_smoothed
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
Return the crossentropy computed after a [`Flux.logsoftmax`](@ref) operation.
`logitcrossentropy(ŷ, y)` is mathematically equivalent to
[`Flux.Losses.crossentropy(softmax(ŷ), y)`](@ref) but it is more numerically stable.
See also: [`Flux.Losses.crossentropy`](@ref), [`Flux.Losses.binarycrossentropy`](@ref), [`Flux.Losses.logitbinarycrossentropy`](@ref)
"""
function logitcrossentropy(yhat, y; dims=1, agg=mean)
  agg(.-sum(y .* logsoftmax(yhat; dims=dims); dims=dims))
end


"""
  binarycrossentropy(ŷ, y; agg=mean, ϵ=eps(ŷ))
Return the binary cross-entropy loss.
The `ϵ` term provides numerical stability.
Typically, the prediction `ŷ` is given by the output of a [`sigmoid`](@ref) activation.
Use of `logitbinarycrossentropy` is recomended over `binarycrossentropy` for numerical stability.
See also: [`Flux.Losses.crossentropy`](@ref), [`Flux.Losses.logitcrossentropy`](@ref), [`Flux.Losses.logitbinarycrossentropy`](@ref)
"""
function binarycrossentropy(yhat, y; agg=mean, epsilon=epseltype(yhat))
  agg(@.(-xlogy(y, yhat + epsilon) - xlogy(1 - y, 1 - yhat + epsilon)))
end


