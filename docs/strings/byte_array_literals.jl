bytestr = b"DATA\xff\u2200"
println(bytestr)
println(isvalid("DATA\xff\u2200")) # false (not valid utf-8)

x = b"123"
println(x)    # UInt8[0x31, 0x32, 0x33]
println(x[1]) # 49 (= decimal repr of hex 0x31)
# x[1] = 0x32 # ERROR setindex! not defined for Base.CodeUnits{UInt8, String}
println(Vector{UInt8}(x)) # UInt8[0x31, 0x32, 0x33]


