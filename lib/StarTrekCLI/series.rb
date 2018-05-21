require 'pry'
require 'byebug'

class Series
  attr_reader :name, :seasons

  def initialize(name = nil)
    @name = name
    @seasons = []
  end
end
