require 'open-uri'
require 'pry'
require 'nokogiri'
require 'rb-readline'

module StarTrekCLI
  class Scraper

    # This method pulls information from the Chakoteya index for each Star Trek series using an iterator. The data is constructed as a hash with `image_url`, `page_url`, and `title` properties. This is yielded as a block argument.
    def each_index_group
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

    def each_series_page(series_url)
      doc = Nokogiri::HTML(open(series_url))
      page_rows = doc.css("body > table > tbody > tr")

      # FIXME: seasons will have some problems like 101 + 102 or the animated series as season "4"

      page_rows.css("table").each_with_index do |table, index|
        rows = table.css("tr")
        rows.shift
        rows.each do |row|
          link = row.css("td")[0].css("a")

          episode_row = {
            :season_number => index + 1,
            :episode_name => link.children.text.strip,
            :episode_url => link.attr("href").value,
            :production_number => row.css("td")[1].text.strip.to_i,
          }
        yield episode_row
        end
      end
    end

    # This method pulls information from the scraped episodes using an iterator. The data is constructed as a hash with `episode_name`, `star_date`, and `air_date` properties. This is yielded as a block argument.
    def episode_page_header(episode_url)
      doc = Nokogiri::HTML(open(episode_url))
      episode_html = doc.css("body > p > font")

      episode_html.each do |info|

          # FIXME: get rid of "stardate" and "airdate"
          episode_stuff = {
            :episode_name => info.children[0].text.strip,
            # more than one way to skin a cat
            :star_date => info.children[1].text.slice(/(?<=:)(.*)/).strip,
            :air_date => info.children[3].text.split(":")[1].strip
          }
        yield episode_stuff
      end
    end


  end # Scraper
end # module StarTrekCLI
