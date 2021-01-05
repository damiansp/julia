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


"""
  logitbinarycrossentropy(ŷ, y; agg=mean)
Mathematically equivalent to
[`binarycrossentropy(σ(ŷ), y)`](@ref) but is more numerically stable.
Use [`label_smoothing`](@ref) to smooth the `y` value as preprocessing before
computing the loss.
See also: [`crossentropy`](@ref), [`logitcrossentropy`](@ref), [`binarycrossentropy`](@ref), [`label_smoothing`](@ref)
"""
function logitbinarycrossentropy(yhat, y; agg=mean)
  agg(@.((1 - y)*yhat - logsigma(yhat)))
end


"""
  kldivergence(ŷ, y; agg=mean)
Return the
[Kullback-Leibler divergence](https://en.wikipedia.org/wiki/Kullback%E2%80%93Leibler_divergence)
between the given probability distributions.
KL divergence is a measure of how much one probability distribution is different
from the other.
It is always non-negative and zero only when both the distributions are equal
everywhere.
"""
function kldivergence(yhat, y; dims=1, agg=mean, epsilon=epseltype(yhat))
  entropy = agg(sum(xlogx.(y), dims=dims))
  cross_entropy = crossentropy(yhat, y; dims=dims, agg=agg, epsilon=epsilon)
  entropy + cross_entropy
end


"""
  poisson_loss(ŷ, y)
Return how much the predicted distribution `ŷ` diverges from the expected Poisson distribution `y`; calculated as `sum(ŷ .- y .* log.(ŷ)) / size(y, 2)`.
REDO
[More information.](https://peltarion.com/knowledge-center/documentation/modeling-view/build-an-ai-model/loss-functions/poisson_loss).  
"""
poisson_loss(yhat, y; agg=mean) = agg(yhat .- xlogy.(y, yhat))


"""
  hinge_loss(ŷ, y; agg=mean)
Return the [hinge_loss loss](https://en.wikipedia.org/wiki/Hinge_loss) given the
prediction `ŷ` and true labels `y` (containing 1 or -1); calculated as
`sum(max.(0, 1 .- ŷ .* y)) / size(y, 2)`.
See also: [`squared_hinge_loss`](@ref)
"""
hinge_loss(yhat, y; agg=mean) = agg(max.(0, 1 .- yhat .* y))


"""
  squared_hinge_loss(ŷ, y)
Return the squared hinge_loss loss given the prediction `ŷ` and true labels `y`
(containing 1 or -1); calculated as `sum((max.(0, 1 .- ŷ .* y)).^2) / size(y, 2)`.
See also: [`hinge_loss`](@ref)
"""
squared_hinge_loss(yhat, y; agg=mean) = agg((max.(0, 1 .- yhat .* y)).^2)


"""
  dice_coeff_loss(ŷ, y; smooth=1)
Return a loss based on the dice coefficient.
Used in the [V-Net](https://arxiv.org/abs/1606.04797) image segmentation
architecture.
"""
dice_coef_loss(yhat, y; smooth=ofeltype(yhat, 1.0)) = (
  1 - (2*sum(y .* yhat) + smooth) / (sum(y.^2) + sum(yhat.^2) + smooth))



"""
  tversky_loss(ŷ, y; β=0.7)
Return the [Tversky loss](https://arxiv.org/abs/1706.05721).
Used with imbalanced data to give more weight to false negatives.
Larger β weigh recall more than precision (by placing more emphasis on false negatives)
"""
function tversky_loss(yhat, y; beta=ofeltype(yhat, 0.7))
  num = sum(y .* yhat) + 1
  den = sum(y .* yhat + beta*(1 .- y) .* yhat + (1 - beta)*y .* (1 .- yhat)) + 1
  1 - num/den
end