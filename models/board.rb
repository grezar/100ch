require 'models/base'

class Board < Model::Base
  attr_reader :id, :name

  def initialize(params = {})
    @id   = params[:id] || params["id"]
    @name = params[:name] || params["name"]
  end
end
