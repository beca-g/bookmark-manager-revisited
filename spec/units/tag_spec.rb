require "tag"

describe Tag do
  describe ".create" do
    it "creates a new tag" do
      tag = Tag.create(content: "Testing tags")

      persisted_data = persisted_data(id: tag.id, table: "tags")

      expect(tag).to be_a Tag
      expect(tag.id).to eq persisted_data.first["id"]
      expect(tag.content).to eq "Testing tags"
    end
  end

  describe ".where" do
    it "returns tags linked to the selected bookmark" do
      bookmark = Bookmark.create(title: "Test", url: "http://www.test.com")

      tag1 = Tag.create(content: "Testing 1st tag")
      tag2 = Tag.create(content: "Testing 2nd tag")

      BookmarkTag.create(bookmark_id: bookmark.id, tag_id: tag1.id)
      BookmarkTag.create(bookmark_id: bookmark.id, tag_id: tag2.id)

      tags = Tag.where(bookmark_id: bookmark.id)
      tag = tags.first

      expect(tags.length).to eq 2
      expect(tag).to be_a Tag
      expect(tag.id).to eq tag1.id
      expect(tag.content).to eq tag1.content
    end
  end
end