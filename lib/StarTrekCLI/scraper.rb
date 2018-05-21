require 'open-uri'
require 'pry'
require 'nokogiri'
require 'rb-readline'

class Scraper

  def scrape_index_page
    doc = Nokogiri::HTML(open("http://chakoteya.net/StarTrek/index.html"))

    doc.css("td a").children

  end

    binding.pry

  end

end # Scraper

Scraper.new.scrape_index_page
