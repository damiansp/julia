using Printf

name = "Pascal"
salutation = @printf("Hello, %s\n", name) # Hello, Pascal
println(typeof(salutation))               # Nothing

greeting = @sprintf("Goodbye, %s\n", name) # 
print(greeting)                            # Goodbye, Pascal
println(typeof(greeting))                  # String

@printf("a pointer: %p\n", 1e10)

if v"0.5" <= VERSION < v"0.6-"
    @printf("Time to update Julia; %s is out of date", VERSION)
else
    @printf("Your version of Julia, (%s), is reasonable up-to-date\n", VERSION)
end

