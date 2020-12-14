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