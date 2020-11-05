module Optimize

using LinearAlgebra

export AdaBelief, ADADelta, ADAGrad, ADAM, ADAMax, ADAMW, AMSGrad, ClipNorm, 
  ClipValue, Descent,  ExpDecay, InvDecay, Momentum, NADAM, Nesterov, OADAM, Optimizer, RADAM, RMSProp, WeightDecay, skip, stop train!, update!

include("optimizers.jl")
include("train.jl")

end