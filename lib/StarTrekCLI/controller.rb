require 'pry'
require 'byebug'

class StarTrekCLI::Controller

  def initialize
  # FIXME: yuck
     StarTrekCLI::Scraper.new.each_index_group do |group|
       StarTrekCLI::Series.new(group[:title])
       # StarTrekCLI::Scraper.each_series_page
     end

    # hard coding to VOY
     StarTrekCLI::Scraper.new.each_series_page("http://chakoteya.net/Voyager/episode_listing.htm") do |row|
      series = StarTrekCLI::Series.find_series_by_name("Voyager")
      StarTrekCLI::Season.new(series, row[:number])
     end

     StarTrekCLI::Scraper.new.episode_page_header("http://chakoteya.net/DS9/401.htm") do |stuff|
       StarTrekCLI::Episode.new(stuff[:name])
     end
  end

  # def call
  #   puts "Welcome to StarTrekCLI!"
  #
  #   help
  #   list_series
  #
  #   loop do
  #     puts "What series would you like to see?"
  #     command = gets.strip.downcase.to_sym
  #
  #     case command
  #     when :exit
  #       puts "Goodbye, ensign!"
  #       break
  #     when :help
  #       help
  #     # when :"list episodes"
  #     #   list_episodes
  #     else
  #       puts "Does not compute, please try again."
  #     end
  #   end
  # end # Controller#call
  #
  # def help
  #   puts "To list all of the Star Trek series, enter 'list series'."
  #   puts "To quit, type 'exit'."
  # end



  def list_series
    StarTrekCLI::Series.all.each do |series|
      puts "#{series.name}"
    end
  end

  # def list_episodes
  # end

end # StarTrekCLI::StarTrekController
