require 'pry'
require 'byebug'
require 'rb-readline'
require 'uri'

class StarTrekCLI::Controller

  # I am a constant <3
  INDEX_URL = "http://chakoteya.net/StarTrek/index.html"

  def initialize(print_progress)
    @scraper = StarTrekCLI::Scraper.new

    @scraper.each_index_group(INDEX_URL) do |group|
      print "!" if print_progress
      # special case: Orginal series title has that weird new line hence the ternary
      title = group[:title] == "Original\nand Animated Series" ? "Star Trek" : group[:title]

      series = StarTrekCLI::Series.new(title)

      # this uses uri which is built into the ruby standardlibrary
      series_url = URI.join(INDEX_URL, group[:page_url])

      current_season = 0
      @scraper.each_series_page(series_url) do |episode_row|
        # for debugging purposes / caching
        if print_progress
          print "?" if current_season != episode_row[:season_number]
          current_season = episode_row[:season_number]
        end

        season = series.season(episode_row[:season_number])

        episode_url = URI.join(INDEX_URL, group[:page_url], episode_row[:episode_url])

        # FIXME: this method needs some work!
        @scraper.episode_page_header(episode_url) do |episode|
          print "." if print_progress
          StarTrekCLI::Episode.new(
            season,
            episode_row[:production_number],
            episode_row[:episode_name],
            episode[:star_date],
            episode[:air_date]
           )

        end
      end
    end
  end

  def list_series
    StarTrekCLI::Series.all.each do |series|
      puts "#{series.name}".colorize(:cyan)
    end
  end

  def list_seasons(series_string)
    series = StarTrekCLI::Series.find_series_by_name(series_string)
    raise "This series is not scraped: '#{series_string}'" unless series
    series.seasons.each do |season|
      if season
        puts season.season_number.to_s.colorize(:green)
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
    season = series.season(season_int)

    ## working on season.episodes
    season.episodes.each do |production_number, episode|
      puts "#{production_number.colorize(:yellow)}: #{episode.name}"
    end
  end


  def list_episode_info(series_string, season_string, production_number)

    raise "series must be an string" unless series_string.is_a? String
    series = StarTrekCLI::Series.find_series_by_name(series_string)

    season_int = season_string.to_i
    unless season_int > 0
      raise "COMPUTER: You must enter an integer for season number. You entered '#{season_string}'"
    end
    season = series.season(season_int)

    production_number_int = production_number.to_i
    unless production_number_int > 0
      raise "COMPUTER: You must enter an integer for production number. You entered '#{production_number}'"
    end

    episode = season.episodes[production_number_int.to_s]

    puts "Air date: #{episode.air_date}"
    puts "Star date: #{episode.star_date}"

  end

end # StarTrekCLI::StarTrekController
