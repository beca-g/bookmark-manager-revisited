feature "adding and viewing comments to bookmarks" do
  feature "a user can add and view a comment" do
    scenario "a comment is added to a bookmark" do
      bookmark = Bookmark.create(url: "http://www.rightmove.com", title: "Right Move")

      visit "/bookmarks"
      first(".bookmark").click_button "Comment"

      expect(current_path).to eq "/bookmarks/#{bookmark.id}/comments/new"

      fill_in "comment", with: "This is a test comment"
      click_button "Submit"

      expect(current_path).to eq "/bookmarks"
      expect(first(".bookmark")).to have_content "This is a test comment"
    end
  end
end
