feature "viewing bookmarks" do
  scenario "a user can see bookmarks" do
    connection =  PG.connect(dbname: "bookmarks_test")

    connection.exec("INSERT INTO bookmarks VALUES(1, 'http://www.asos.com');")
    connection.exec("INSERT INTO bookmarks VALUES(2, 'http://www.rightmove.com');")
    connection.exec("INSERT INTO bookmarks VALUES(3, 'http://www.cultbeauty.co.uk');")

    visit('/bookmarks')

    expect(page).to have_content "http://www.asos.com"
    expect(page).to have_content "http://www.rightmove.com"
    expect(page).to have_content "http://www.cultbeauty.co.uk"
  end
end
