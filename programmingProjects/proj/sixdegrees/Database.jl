module Database

using MySQL
#import JSON

config = open("db_config.json") do f
  read(f, String)
end
pwd = String(split(config)[end][2:end-2])

const HOST = "localhost"
const USER = "root"
const DB = "six_degrees"
const CONN = MySQL.connect(HOST, USER, pwd, db=DB)

export CONN


disconnect() = MySQL.disconnect(CONN)
atexit(disconnect)


end
