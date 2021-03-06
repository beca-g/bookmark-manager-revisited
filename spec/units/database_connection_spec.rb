require "database_connection"

describe "DatabaseConnection" do
  describe ".setup" do
    it "sets up a connection to a database through PG" do
      expect(PG).to receive(:connect).with(dbname: "bookmarks_test")

      DatabaseConnection.setup("bookmarks_test")
    end
  end

  describe ".connection" do
    it "the connection is persistent" do
      connection = DatabaseConnection.setup("bookmarks_test")

      expect(DatabaseConnection.connection).to eq connection
    end
  end

  describe ".query" do
    it "executes a query via PG" do
      connection = DatabaseConnection.setup("bookmarks_test")

      expect(connection).to receive(:exec).with("SELECT * FROM bookmarks;")
      
      DatabaseConnection.query("SELECT * FROM bookmarks;")
    end
  end
end
