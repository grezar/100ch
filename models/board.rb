require 'models/base'
require 'models/topic'

class Board < Model::Base
  attr_accessor :id
  attr_reader :name

  def initialize(params = {})
    @id   = params[:id] || params["id"]
    @name = params[:name] || params["name"]
  end

  def topics
    Topic.where(board_id: id)
  end
end
