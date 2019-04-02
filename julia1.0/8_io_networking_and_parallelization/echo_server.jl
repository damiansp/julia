using Sockets


server = Sockets.listen(8080)
println("Server listening on localhost:8080")
while true
  conn = accept(server)
  @async begin
    try
      while true
        line = readline(conn)
        println(line)
        write(conn, line)
      end
    catch ex
      print("connection ended with error $ex")
    end
  end
end


# Example: in julia shell:
#using Sockets
#conn = Sockets.connect(8080)
#write(conn, "Do you hear me?\n")
