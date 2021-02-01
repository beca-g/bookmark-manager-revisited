feature "adding bookmarks" do
  scenario "a user can save a new bookmark" do
    visit("/bookmarks/new")
    fill_in("url", with: "http://www.test.com")
    click_button("Save")

    expect(page).to have_content "http://www.test.com"
  end  
end