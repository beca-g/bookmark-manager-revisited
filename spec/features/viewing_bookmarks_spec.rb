feature "viewing bookmarks" do
  scenario "a user can see bookmarks" do
    Bookmark.create(url: "http://www.asos.com", title: "ASOS")
    Bookmark.create(url: "http://www.rightmove.com", title: "Right Move")
    Bookmark.create(url: "http://www.cultbeauty.co.uk", title: "Cult Beauty")

    visit('/bookmarks')

    expect(page).to have_link("ASOS", href: "http://www.asos.com")
    expect(page).to have_link("Right Move", href: "http://www.rightmove.com")
    expect(page).to have_link("Cult Beauty", href: "http://www.cultbeauty.co.uk")
  end
end
