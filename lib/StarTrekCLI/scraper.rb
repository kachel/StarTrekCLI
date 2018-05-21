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
    end
        # TODO: FUCKING ENTERPRISE THE GARBAGE SERIESSSS

    def each_table_cell_series
      doc = Nokogiri::HTML(open("http://chakoteya.net/StarTrek/episodes.htm"))
      page_rows = doc.css("body > table > tbody > tr")

      page_rows.css("table").each do |table|
        rows = table.css("tr")
        rows.shift

        rows.each do |row|
          episode_row = {
            :episode_name => row.css("td")[0].text.strip,
            :production_date => row.css("td")[1].text.strip,
            :air_date => row.css("td")[2].text.strip,
          }
        end
      end
    end


  end # Scraper
end # module StarTrekCLI
