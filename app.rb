require 'sinatra'
require 'sinatra/reloader'
require 'slim'
require 'models/init'

register Sinatra::Reloader

class App < Sinatra::Base
  set :method_override, true

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

  delete '/board/:id' do
    board = Board.find(params['id'])
    board.destroy
    @boards = Board.all
    redirect "/"
  end
end
