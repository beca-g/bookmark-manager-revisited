feature "adding bookmarks" do
  scenario "a user can save a new bookmark" do
    visit("/bookmarks/new")
    fill_in("url", with: "http://www.test.com")
    fill_in("title", with: "Test")
    click_button("Save")

    expect(page).to have_link("Test", href: "http://www.test.com")
  end  

  scenario "a user can only enter a valid URL" do
    visit("/bookmarks/new")
    fill_in("url", with: "test bookmark")
    fill_in("title", with: "Test")
    click_button("Save")

    expect(page).not_to have_content "test bookmark"
    expect(page).to have_content "You must submit a valid URL"
  end
end
