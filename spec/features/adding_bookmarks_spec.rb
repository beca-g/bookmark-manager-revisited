feature "adding bookmarks" do
  scenario "a user can save a new bookmark" do
    visit("/bookmarks/new")
    fill_in("url", with: "http://www.test.com")
    fill_in("title", with: "Test")
    click_button("Save")

    expect(page).to have_link("Test", href: "http://www.test.com")
  end  
end
