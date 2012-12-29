require 'nokogiri'
require 'open-uri'

class StyleScraper

  def initialize uri
    @uri = uri
    @page = Nokogiri::HTML( open( @uri ) )
  end

  def get_css_links
    links = []
    links = @page.css("link").select{ |link| link['rel'] == 'stylesheet' }
    links
  end


end
