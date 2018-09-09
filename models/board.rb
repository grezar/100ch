require 'models/base'

class Board < Model::Base
  def initialize(params = {})
    @name = params[:name]
  end
end
