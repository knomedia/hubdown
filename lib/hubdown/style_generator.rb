require 'hubdown/style_scraper'

class StyleGenerator
  def initialize uri
    @uri = uri
    @scraper = StyleScraper.new( @uri )
    @links = scraper.get_css_links
  end


  def get_css_links
   @links 
  end
end
