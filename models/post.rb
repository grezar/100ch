require 'models/base'

class Post < Model::Base
  attr_accessor :id
  attr_reader :body, :topic_id

  def initialize(params = {})
    @id = params[:id] || params["id"]
    @body = params[:body] || params["body"]
    @topic_id = params[:topic_id] || params["topic_id"]
  end
end
