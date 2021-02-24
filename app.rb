require 'sinatra/base'
require './lib/bookmarks'
class Bookmark_App < Sinatra::Base
  enable :sessions

  get '/bookmarks' do
    # connection = PG.connect(dbname: "Bookmark Manager")
    # @result = connection.exec('SELECT * FROM bookmarks')
    @bookmarks = Bookmarks.all
    erb :bookmarks
  end

  post '/add_bookmark' do
    Bookmarks.add_new(params[:new_url], params[:new_title])
    redirect '/bookmarks'
  end
  run! if app_file == $0
end
