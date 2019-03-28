#throw(KeyError("href")) # ERROR: KeyError: key "href" not found

ex = ErrorException(
    "To err is human, but to really foul things up, you need a computer")
#throw(ex)

println(ex.msg)


try
    Dict()[:foo]
catch ex
    println("nothing to see here")
end
# nothing to see here

#try
#    Dict()[:foo]
#catch ex
#    throw(ex)
#end
# ERROR: KeyError...

try
    Dict()[:foo]
catch ex
    rethrow(ex)
end
