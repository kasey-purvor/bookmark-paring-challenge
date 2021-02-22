require 'sinatra/base'
require './lib/bookmarks'
class Bookmark_App < Sinatra::Base
  enable :sessions

  get '/' do
    @bookamarks = Bookmarks.new
    erb :bookmarks
  end











end
