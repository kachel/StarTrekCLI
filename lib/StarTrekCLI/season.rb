class StarTrekCLI::Season
  attr_reader :season_number, :episodes, :series

  @@all = []

  # series is an instance of Series and also gives it a relationship
  def initialize(series, season_number)
    raise "season must be an integer" unless season_number.is_a? Integer
    raise "series must be a Series instance" unless series.is_a? StarTrekCLI::Series
    @series = series
    @season_number = season_number
    @episodes = {}
    @@all << self
    series.seasons[season_number] = self
  end

  def self.all
    @@all
  end

end
