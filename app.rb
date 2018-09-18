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

  get '/board/:id' do
    @board = Board.find(params['id'])
    slim :show
  end

  delete '/board/:id' do
    board = Board.find(params['id'])
    board.destroy
    @boards = Board.all
    redirect "/"
  end

  get '/topic/new' do
    @topic = Topic.new
    slim :'topic/new'
  end

  get '/topic/:id' do
    @topic = Topic.find(params['id'])
    slim :'topic/show'
  end

  post '/topic/new' do
    @topic = Topic.new(params)
    @topic.save
    redirect "/topic/#{@topic.id}"
  end

  post '/post/new' do
    @post = Post.new(params)
    @post.save
    redirect "/topic/#{@post.topic_id}"
  end
end
