require 'nokogiri'
require 'open-uri'

class StyleScraper

  def initialize uri
    @uri = uri
    begin
      @page = Nokogiri::HTML( open( @uri ) )
    rescue
      puts "It appears we are unable to connect to: #{@uri} for CSS scraping." 
      puts "Please check your internet connection"
      exit 0
    end
  end

  def get_css_links
    links = []
    links = @page.css("link").select{ |link| link['rel'] == 'stylesheet' }
    links
  end


end
