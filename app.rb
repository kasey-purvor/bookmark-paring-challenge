require 'sinatra/base'
require './lib/bookmarks'
class Bookmark_App < Sinatra::Base
  enable :sessions

  get '/home' do
    # @bookmarks = Bookmarks.new
    erb :home
  end

  get '/bookmarks' do
    @bookmarks = Bookmarks.all
    erb :bookmarks
  end

  run! if app_file == $0
end

