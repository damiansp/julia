"""
Penalized log-likelihood function for a histogram with d regular bins.
Args:
  d: Number of bins in the histogram.
  n: Number of sample (which should equal sum(bincounts[1:d])).
  bincounts: An array giving the number occurrences in each bin.
  binwidth: Width of each bin in the histogram.
Returns:
  Log-likelihood with Birge's penalty applied.
"""
function bincount_pll(
    d::Int, n::Int, bincounts::Vector{Int}, binwidth::AbstractFloat)
  ll = 0
  for i in 1:d
    if bincounts[i] > 0
      ll += bincounts[i] * log(d*bincounts[i] / (n*binwidth))
    end
  end
  ll - (d - 1 + log(d)^2.5)
end


"""
Estimate proportion of values that are distinct
Sample enough values to decide whether we're effectively continuous (defined as
>90% of the sampled values are unique) By looking at a subset we ensure this 
isn't a bottleneck
"""
function estimate_ditinct_proportion(values::AbstractArray{T}) where T
  uvalues = Set{T}()
  n_sampled = n_tried = 0
  while n_sampled < 15 && n_tried < length(values)
    v = values[rand(1:length(values))]
    n_tried += 1
    Gadfly.isconcrete(v) || continue
    n_sampled += 1
    push!(uvalues, v)
  end
  length(uvalues) / n_sampled
end

