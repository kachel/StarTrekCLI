require 'pry'
require 'byebug'

class StarTrekCLI::Series
  attr_reader :name, :seasons, :title_card

  @@all = []

  def initialize(name = nil)
    @name = name
    @seasons = []
    @@all << self
  end

  def self.all
    @@all
  end

end
