require "bookmark"
require "database_helpers"

describe Bookmark do
  let(:comment_class) { double(:comment_class) }

  describe ".all" do
    it "returns all bookamrks" do
      PG.connect(dbname: "bookmarks_test")

      bookmark = Bookmark.create(title: "ASOS", url: "http://www.asos.com")
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
    it "creates a new bookmark" do 
      bookmark = Bookmark.create(title: "Test", url: "http://www.test.com")
      persisted_data = persisted_data(table: "bookmarks", id: bookmark.id)

      expect(bookmark).to be_a Bookmark
      expect(bookmark.id).to eq persisted_data.first["id"]
      expect(bookmark.title).to eq "Test"
      expect(bookmark.url).to eq "http://www.test.com"
    end

    it "does not create a new bookmark if the URL is not valid" do
      Bookmark.create(title: "Test", url: "test")
      expect(Bookmark.all).to be_empty
    end
  end

  describe ".delete" do
    it "deletes the selected bookmark" do
      bookmark = Bookmark.create(title: "Test", url: "http://www.test.com")

      Bookmark.delete(id: bookmark.id)

      expect(Bookmark.all.length).to eq 0
    end
  end

  describe ".update" do
    it "updates a selected bookmark" do
      bookmark = Bookmark.create(title: "Test", url: "http://www.test.com")
      updated_bookmark = Bookmark.update(id: bookmark.id, title: "Testing", url: "http://www.test123.com")

      expect(updated_bookmark).to be_a Bookmark
      expect(updated_bookmark.id).to eq bookmark.id
      expect(updated_bookmark.title).to eq "Testing"
      expect(updated_bookmark.url).to eq "http://www.test123.com"
    end
  end

  describe ".find" do
    it "returns the requested bookmark object" do
      bookmark = Bookmark.create(title: "Test", url: "http://www.test.com")

      result = Bookmark.find(id: bookmark.id)

      expect(result).to be_a Bookmark
      expect(result.id).to eq bookmark.id
      expect(result.title).to eq "Test"
      expect(result.url).to eq "http://www.test.com"
    end
  end

  describe "#comments" do
    
    it "returns a list of comments from a selected bookmark" do
      bookmark = Bookmark.create(title: "Test", url: "http://www.test.com")
      DatabaseConnection.query("INSERT INTO comments (id, text, bookmark_id) VALUES(1, 'Testing comments', #{bookmark.id})")

      comment = bookmark.comments.first

      expect(comment.text).to eq "Testing comments"
    end

    it "calls .where on the Comment class" do
      bookmark = Bookmark.create(title: "Test", url: "http://www.test.com")
      expect(comment_class).to receive(:where).with(bookmark_id: bookmark.id)
  
      bookmark.comments(comment_class)
    end
  end
end
