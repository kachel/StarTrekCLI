require 'pry'
require 'byebug'
require 'rb-readline'

class StarTrekCLI::Controller

  def initialize
  # FIXME: yuck
     StarTrekCLI::Scraper.new.each_index_group do |group|
      # this is a bad practice but
      title = group[:title] == "Original\nand Animated Series" ? "Star Trek" : group[:title]
       StarTrekCLI::Series.new(title)
       # StarTrekCLI::Scraper.each_series_page
     end

    # hard coding for the moment
     StarTrekCLI::Scraper.new.each_series_page("http://chakoteya.net/StarTrek/episodes.htm") do |episode_row|
      series = StarTrekCLI::Series.find_series_by_name("Star Trek")
      season = series.season(episode_row[:season_number])
      # NYI: episode_url
      StarTrekCLI::Episode.new(season, episode_row[:production_number], episode_row[:episode_name])
     end

     StarTrekCLI::Scraper.new.episode_page_header("http://chakoteya.net/DS9/401.htm") do |stuff|
       StarTrekCLI::Episode.new(season, number)
     end
  end

  def list_series
    StarTrekCLI::Series.all.each do |series|
      puts "#{series.name}"
    end
  end

  def list_seasons(series_string)
    series = StarTrekCLI::Series.find_series_by_name(series_string)
    series.seasons.each do |season|
      if season
        puts season.number
      end
    end
  end

  def list_episodes(series_string, season_string)
    raise "series must be an string" unless series_string.is_a? String
    season_int = season_string.to_i

    unless season_int > 0
      raise "You must enter an integer for season number. You entered '#{season_string}'"
    end

    series = StarTrekCLI::Series.find_series_by_name(series_string)

    selected_season = series.seasons[season_int]

    selected_season.episodes.each do |episode|
      if episode
        puts "#{episode.name}"
      end
    end
  end

end # StarTrekCLI::StarTrekController
