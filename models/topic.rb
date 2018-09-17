require 'models/base'

class Topic < Model::Base
  attr_accessor :id
  attr_reader :name, :board_id

  def initialize(params = {})
    @id = params[:id] || params["id"]
    @name = params[:name] || params["name"]
    @board_id = params[:board_id] || params["board_id"]
  end
end
