require 'pry'
require 'byebug'

class StarTrekCLI::Episode
  attr_reader :name, :air_date, :star_date

  def initialize(name = nil)
    @name = name
  end
end
