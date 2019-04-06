using ODBC

# To see availbale ODBC drivers:
ODBC.listdsns()

dsn = ODBC.DSN("pubsODBC", user, password)

results = ODBC.query(dsn, "SELECT * FROM titles LIMIT 30;")

updsql = "UPDATE titles SET type = 'psychology' WHERE title_id = 'BU1032'"
stmt = ODBC.prepare(dsn, updsql)
ODBC.execute!(stmt)

