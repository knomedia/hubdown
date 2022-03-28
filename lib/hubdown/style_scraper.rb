require 'nokogiri'
require 'open-uri'
require 'hubdown/style_sheet'

class StyleScraper

  def initialize uri
    @uri = uri
    begin
      @page = Nokogiri::HTML( URI.open( @uri ) )
    rescue
      # do nothing
    end
  end

  def get_css_links
    links = []
    if @page
      tag_links = @page.css("link").select{ |link| link['rel'] == 'stylesheet' }
      tag_links.each do |tag|
        ss = StyleSheet.new
        ss.from_tag(tag.to_s)
        links << ss
      end
    end
    links
  end


end
