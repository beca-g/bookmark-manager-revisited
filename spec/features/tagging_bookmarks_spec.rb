feature "adding and viewing tags to bookmarks" do
  scenario "a user can add aa tag to a bookmark" do
    bookmark = Bookmark.create(url: "http://www.test.com", title: "Test")

    visit("/bookmarks")
    first(".bookmark").click_button "Tag"

    # p current_path
    expect(current_path).to eq "/bookmarks/#{bookmark.id}/tags/new"

    fill_in("tag", with: "Test Tag")
    click_button("Save")

    expect(current_path).to eq "/bookmarks"
    expect(first(".bookmark")).to have_content("Test Tag")
  end
end