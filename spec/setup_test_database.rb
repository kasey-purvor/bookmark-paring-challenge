require 'pg'

p "setting up the database"

def setup_test_database
  connection = PG.connect(dbname: "Bookmark Manager Test")
  connection.exec("TRUNCATE bookmarks;")
end
