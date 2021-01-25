require "bookmark"

describe Bookmark do
  describe ".all" do
    it "returns all bookamrks" do
      bookmarks = Bookmark.all

      expect(bookmarks).to include "http://www.asos.com"
      expect(bookmarks).to include "http://www.rightmove.com"
      expect(bookmarks).to include "http://www.cultbeauty.co.uk"
    end
  end
end
