require 'hubdown/style_scraper'
require 'erb'

module Hubdown
  class PageBuilder
    
    def initialize body
      @body = body
      @scraper = StyleScraper.new( 'https://github.com/knomedia/hubdown' )
    end

    def get_page
      links = @scraper.get_css_links
      body = @body
      template = ERB.new( File.read "lib/hubdown/template.html.erb" )
      page = template.result(binding)
      page      
    end
  end
end
