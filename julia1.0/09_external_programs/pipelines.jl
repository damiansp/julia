file = "shell_commands.jl"
run(pipeline(`cat $file`, "test.txt"))
run(pipeline("test.txt", `cat`))
run(pipeline(`echo $("\nHi,\nJulia!")`, `cat`, `grep -n J`))
run(pipeline(`cat "tosort.txt"`, `sort`))
run(`grep shell $(readdir())`)

a = read(pipeline(`cat "tosort.txt"`, `sort`))
