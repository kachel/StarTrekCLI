class StarTrekCLI::Series
  attr_reader :name, :seasons, :title_card

  @@all = []

  def initialize(name)
    @name = name
    @seasons = []
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_series_by_name(series_name)
    @@all.find do |n|
      n.name == series_name
    end
  end

  def season(season_number)
    @seasons[season_number] || StarTrekCLI::Season.new(self, season_number)
  end


end
