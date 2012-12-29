require 'hubdown/style_scraper'
require 'erb'

module Hubdown
  class PageBuilder
    
    def initialize args
      @body = args.fetch("body"){ '' }
      @uri = args.fetch("uri"){ 'https://github.com/knomedia/hubdown' }
      @filename = args.fetch("filename"){ '' }
      @scraper = StyleScraper.new( @uri )
    end

    def get_page
      links = @scraper.get_css_links
      body = @body
      filename = @filename
      template = ERB.new( File.read("lib/hubdown/template.html.erb"), nil, "-" )
      page = template.result(binding)
      page      
    end
  end
end
