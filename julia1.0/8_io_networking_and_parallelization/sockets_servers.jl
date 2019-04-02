using Sockets


server = Sockets.listen(8080)
println("server listening on localhost:8080")
conn = accept(server)
line = readline(conn)
write(conn, line)
write(conn, "Hello from the server!")
close(conn)
