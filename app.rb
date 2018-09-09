require 'sinatra'
require 'sinatra/reloader'
require 'slim'
require 'models/init'

register Sinatra::Reloader

class App < Sinatra::Base
  get '/' do
    @boards = Board.all
    slim :index
  end

  get '/board/new' do
    @board = Board.new
    slim :new
  end

  post '/board/new' do
    @board = Board.new(params)
    @board.save
    redirect "/"
  end
end
