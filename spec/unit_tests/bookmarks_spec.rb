require 'bookmarks'

describe Bookmarks do
  describe '.all' do
    it 'returns all bookmarks' do
      connection = PG.connect(dbname: "Bookmark Manager Test")
      Bookmarks.add_new('http://www.makersacademy.co.uk', 'Makers')
      Bookmarks.add_new('http://www.askjeeves.com', 'ask jeeves')
      Bookmarks.add_new('http://www.google.com','Google')
      bookmarks = Bookmarks.all
      expect(bookmarks.length).to eq(3)
    end
  end

  it "it reports the url, title or id when called " do
    bookmark = Bookmarks.add_new('http://www.google.com', 'Google')
    bookmarks = Bookmarks.all
    expect(bookmarks.first.title).to eq("Google")
    expect(bookmarks.first.id).to eq(bookmark.id)
    expect(bookmarks.first.url).to eq("http://www.google.com")
  end
end
