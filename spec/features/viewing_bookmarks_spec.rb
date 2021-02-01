feature "viewing bookmarks" do
  scenario "a user can see bookmarks" do
    Bookmark.create(url: "http://www.asos.com")
    Bookmark.create(url: "http://www.rightmove.com")
    Bookmark.create(url: "http://www.cultbeauty.co.uk")

    visit('/bookmarks')

    expect(page).to have_content "http://www.asos.com"
    expect(page).to have_content "http://www.rightmove.com"
    expect(page).to have_content "http://www.cultbeauty.co.uk"
  end
end
