require 'pg'

def setup_test_database
  connection = PG.connect(dbname: "bookmarks_test")
  connection.exec("TRUNCATE bookmarks, comments, tags, bookmark_tags;")
end
