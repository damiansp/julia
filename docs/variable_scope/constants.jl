const e = 2.71828182845904523536
const pi = 3.14159265358979323846
const a, b = 1, 2


const x = 1
f() = x
println(f()) # 1
x = 2 # Warning: redefining const x
println(f()) # 1 (unaffected)
