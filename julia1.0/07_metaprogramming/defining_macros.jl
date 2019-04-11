using Printf


macro macint(ex)
  quote
    println("start")
    $ex
    println("after")
  end
end

@macint println("Stuck in the middle with you.")


macro assert(ex)
  :($ex ? nothing : error("Assertion failed: ", $(string(ex))))
end

@assert 1 == 1.0 # nothing
#@assert 1 == 42  # ERROR: Assertion failed...

println(macroexpand(Main, :(@assert 1 == 42)))


macro unless(test_cond, branch)
  quote
    if !$test_cond
      $branch
    end
  end
end

arr = [3.14, 42, 'b']
@unless 42 in arr println("arr does not contain 42") # does nothing
@unless 41 in arr println("arr does not contain 41") # prints


# Hygienic macros (export-safe)
macro timeit(ex)
  quote
    # all defined vars should use local
    local t0 = time()
    # escape expressions so interpolated expressions are not expanded, but used
    # literally
    local val = $(esc(ex))
    local t1 = time()
    print("elapsed time in s: ")
    @printf "%.3f\n" t1 - t0
    val
  end
end

println(@timeit factorial(10))
println(@timeit 3.14159^3)
