lang = ccall((:getenv, "libc"), Cstring, (Cstring,), "LANG")
