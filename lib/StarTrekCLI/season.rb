require 'pry'
require 'byebug'

class StarTrekCLI::Season
  attr_reader :number, :episodes, :series

  @@all = []

  # series is an instance of Series and also gives it a relationship
  def initialize(series, number)
    @series = series
    @number = number
    @episodes = []
    @@all << self
    series.seasons[number] = self
  end

  def self.all
    @@all
  end

end
