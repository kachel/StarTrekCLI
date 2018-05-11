require "pry"
require "byebug"

class Series
  attr_reader :name, :season

  def initialize(name=nil)
    @name = name
  end

  def season
    @season
  end


end
