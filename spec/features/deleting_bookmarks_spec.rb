feature "deleting bookmarks" do
  scenario "a user can delete a bookmark" do
    Bookmark.create(title: "Test", url: "http://www.test.com")
    visit("/bookmarks")
    expect(page).to have_link("Test", href: "http://www.test.com")
    
    first(".bookmark").click_button "Delete"

    expect(current_path).to eq "/bookmarks"
    expect(page).not_to have_link("Test", href: "http://www.test.com")
  end  
end
