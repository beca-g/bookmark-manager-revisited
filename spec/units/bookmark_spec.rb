require "bookmark"
require "database_helpers"

describe Bookmark do
  describe ".all" do
    it "returns all bookamrks" do
      connection =  PG.connect(dbname: "bookmarks_test")

      bookmark = Bookmark.create(title: "ASOS", url:"http://www.asos.com")
      Bookmark.create(title: "Right Move", url: "http://www.rightmove.com")
      Bookmark.create(title: "Cult Beauty", url: "http://www.cultbeauty.co.uk")

      bookmarks = Bookmark.all

      expect(bookmarks.length).to eq 3
      expect(bookmarks.first).to be_a Bookmark
      expect(bookmarks.first.id).to eq bookmark.id
      expect(bookmarks.first.title).to eq "ASOS"
      expect(bookmarks.first.url).to eq "http://www.asos.com"
    end
  end

  describe ".create" do
    it "creates a new bookamrk" do 
      bookmark = Bookmark.create(title: "Test", url: "http://www.test.com")
      persisted_data =  persisted_data(id: bookmark.id)

      expect(bookmark).to be_a Bookmark
      expect(bookmark.id).to eq persisted_data["id"]
      expect(bookmark.title).to eq "Test"
      expect(bookmark.url).to eq "http://www.test.com"
    end
  end

  describe ".delete" do
    it "deletes the selected bookmark" do
      bookmark = Bookmark.create(title: "Test", url: "http://www.test.com")

      Bookmark.delete(id: bookmark.id)

      expect(Bookmark.all.length).to eq 0
    end
  end
end
