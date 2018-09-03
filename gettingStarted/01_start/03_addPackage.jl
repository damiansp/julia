using Pkg
Pkg.update()
Pkg.add("Winston")

using Winston
plot(rand(100))
