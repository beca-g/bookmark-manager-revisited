require "bookmark_tag"

describe BookmarkTag do
  describe ".create" do
    it "creates a link between a bookmark and a tag" do
      bookmark = Bookmark.create(title: "Test", url: "http://www.test.com")
      tag = Tag.create(content: "Testing tags")

      bookmark_tag = BookmarkTag.create(tag_id: tag.id, bookmark_id: bookmark.id)
      
      expect(bookmark_tag).to be_a BookmarkTag
      expect(bookmark_tag.tag_id).to eq tag.id
      expect(bookmark_tag.bookmark_id).to eq bookmark.id
    end
  end
end