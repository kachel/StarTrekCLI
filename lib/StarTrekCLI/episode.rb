require 'pry'
require 'byebug'

class StarTrekCLI::Episode
  attr_reader :name, :air_date, :star_date

  @@all = []
  def initialize(name = nil)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

end
