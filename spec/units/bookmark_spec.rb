require "bookmark"

describe Bookmark do
  describe ".all" do
    it "returns all bookamrks" do
      connection =  PG.connect(dbname: "bookmarks_test")

      connection.exec("INSERT INTO bookmarks VALUES(1, 'http://www.asos.com');")
      connection.exec("INSERT INTO bookmarks VALUES(2, 'http://www.rightmove.com');")
      connection.exec("INSERT INTO bookmarks VALUES(3, 'http://www.cultbeauty.co.uk');")

      bookmarks = Bookmark.all

      expect(bookmarks).to include "http://www.asos.com"
      expect(bookmarks).to include "http://www.rightmove.com"
      expect(bookmarks).to include "http://www.cultbeauty.co.uk"
    end
  end

  describe ".create" do
    it "creates a new bookamrk" do 
      Bookmark.create(url: "http://www.test.com")

      expect(Bookmark.all).to include "http://www.test.com"
    end
  end
end
