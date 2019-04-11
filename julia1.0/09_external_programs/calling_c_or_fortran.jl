if find_library(["libc"]) != " "
    lang = ccall((:getenv, "libc"), Cstring, (Cstring,), "LANG")
end


