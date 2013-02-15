require 'hubdown/style_scraper'
require 'hubdown/style_cache'
require 'pry'

class StyleGenerator
  def initialize uri
    @uri = uri
    @scraper = StyleScraper.new( @uri )
    @cache = StyleCache.new

    determine_css

  end

  def determine_css
    live_links = @scraper.get_css_links
    cached_links = @cache.get_css_links
    if (live_links.length == 0)
      if (cached_links.length == 0)
        notify_error
      else
        @links = cached_links
      end
    else
      if cached_links.length != 0
        if !links_same(cached_links, live_links)
          @cache.save_links live_links
        end
      else
        @cache.save_links live_links
      end
      @links = live_links
    end
  end

  def links_same cached, live
    same = true
    same = cached.length == live.length;
    if same
     cached.each do |cache_link|
      live.each do |live_link|
        same = cache_link.name == live_link.name
        break unless !same
      end
     end 
    end
    same
  end
  
  def notify_error
    puts "It appears we are unable to connect to: #{@uri} for CSS scraping." 
    puts "There is no cached version of the styles available"
    puts "Please check your internet connection, or drop the -w param"
    exit 0
  end

  def get_css_links
   @links 
  end
end
