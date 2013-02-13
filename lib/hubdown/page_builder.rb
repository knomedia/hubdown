require 'hubdown/style_generator'
require 'erb'

module Hubdown
  class PageBuilder
    
    def initialize args
      @body = args.fetch("body"){ '' }
      @uri = args.fetch("uri"){ 'https://github.com/knomedia/hubdown' }
      @filename = args.fetch("filename"){ '' }
      @style_gen = StyleGenerator.new( @uri )
    end

    def get_page
      links = @style_gen.get_css_links
      body = @body
      filename = @filename
      template_path = File.dirname(__FILE__) + "/template.html.erb"
      template = ERB.new( File.read( template_path ), nil, "-" )
      page = template.result(binding)
      page      
    end
  end
end
