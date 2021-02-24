require 'pg'

class Bookmarks
  attr_reader :url, :title, :id

  def initialize(url, title, id)
    @url = url
    @title = title
    @id = id
  end

  def self.all
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname:'Bookmark Manager Test')
    else
      connection = PG.connect(dbname:'Bookmark Manager')
    end
    result = connection.exec('SELECT * FROM bookmarks;')
    result.map do  |bookmark|
      Bookmarks.new(bookmark["url"], bookmark["title"], bookmark["id"])
    end
  end

   def self.add_new(url, title)
     if ENV['RACK_ENV'] == 'test'
       connection = PG.connect(dbname: "Bookmark Manager Test")
     else
       connection = PG.connect(dbname: "Bookmark Manager")
     end
     result = connection.exec("INSERT INTO bookmarks (url, title) VALUES ('#{url}', '#{title}') RETURNING id, title, url ;")
     Bookmark.new(result[0]['url'], result[0]['title'], result[0]['id'])
   end



end
