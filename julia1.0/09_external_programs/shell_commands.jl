cmd = `echo Hello, Julia!`
println(typeof(cmd)) # Cmd
run(cmd)             # Hello, Julia!
run(`date`)

file = "shell_commands.jl"
run(`cat $file`)
