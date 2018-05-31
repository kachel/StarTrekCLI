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

    # hard coding
     StarTrekCLI::Scraper.new.each_series_page("http://chakoteya.net/StarTrek/episodes.htm") do |row|
      series = StarTrekCLI::Series.find_series_by_name("Star Trek")
      StarTrekCLI::Season.new(series, row[:season_number])
     end

     StarTrekCLI::Scraper.new.episode_page_header("http://chakoteya.net/DS9/401.htm") do |stuff|
       StarTrekCLI::Episode.new(stuff[:name])
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

  def list_episodes
    StarTrekCLI::Episode.all.each do |episode|
      puts "#{episode.name}"
    end
  end

end # StarTrekCLI::StarTrekController
