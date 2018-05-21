require 'open-uri'
require 'pry'
require 'nokogiri'
require 'rb-readline'

module StarTrekCLI
  class Scraper

    def each_table_cell
      # FIXME: there might be a ghost tbody hanging around
      doc = Nokogiri::HTML(open("http://chakoteya.net/StarTrek/index.html"))
      table = doc.css("tbody")

      row1 = table.css("tr")[0].css("td a img") # images
      row2 = table.css("tr")[1].css("a") # links

      (0..3).each do |column|
        cell_group = {
          :image_url => row1[column].attr("src"),
          :page_url => row2[column].attr("href"),
          :title => row2[column].children.first.content.strip
        }
        yield cell_group
      end

      # TODO: FUCKING ENTERPRISE THE GARBAGE SERIESSSS

    end

  end # Scraper
end # module StarTrekCLI
