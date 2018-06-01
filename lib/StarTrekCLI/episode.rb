require 'pry'
require 'byebug'

class StarTrekCLI::Episode
  attr_reader :name, :air_date, :star_date

  @@all = []

  def initialize(season, number)
    @name = name
    @@all << self
    season.episodes[number] = self
  end

  def self.all
    @@all
  end

end
