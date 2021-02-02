feature "updating bookmarks" do
  scenario "a user can update a bookmark" do
    bookmark = Bookmark.create(title: "Test", url: "http://www.test.com")
    visit("/bookmarks")
    expect(page).to have_link("Test", href: "http://www.test.com")

    first(".bookmark").click_button "Edit"
    expect(current_path).to eq "/bookmarks/#{bookmark.id}/edit"

    fill_in("url", with: "http://www.testing123.com")
    fill_in("title", with: "Testing")
    click_button("Save")
    
    expect(current_path).to eq "/bookmarks"
    expect(page).not_to have_link("Test", href: "http://www.test.com")
    expect(page).to have_link("Testing", href: "http://www.testing123.com")
  end
end
