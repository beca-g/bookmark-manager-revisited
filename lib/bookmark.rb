require "pg"

class Bookmark
  attr_reader :id, :title, :url
  
  def initialize(id:, title:, url:)
    @id = id
    @title = title
    @url = url
  end

  def self.all 
    if ENV["ENVIRONMENT"] == "test" 
      connection = PG.connect(dbname: "bookmarks_test")
    else
      connection = PG.connect(dbname: "bookmarks")
    end
    result = connection.exec("SELECT * FROM bookmarks;")
    result.map do |bookmark| 
      Bookmark.new(id: bookmark["id"], title: bookmark["title"], url: bookmark["url"]) 
    end
  end

  def self.create(url:, title:)
    if ENV["ENVIRONMENT"] == "test" 
      connection = PG.connect(dbname: "bookmarks_test")
    else
      connection = PG.connect(dbname: "bookmarks")
    end
    result = connection.exec("INSERT INTO bookmarks (title, url) VALUES('#{title}', '#{url}') RETURNING id, title, url")
    Bookmark.new(id: result[0]["id"], title: result[0]["title"], url: result[0]["url"])
  end

  def self.delete(id:)
    if ENV["ENVIRONMENT"] == "test" 
      connection = PG.connect(dbname: "bookmarks_test")
    else
      connection = PG.connect(dbname: "bookmarks")
    end
    connection.exec("DELETE FROM bookmarks WHERE id = #{id}")
  end
end
