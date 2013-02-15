require 'hubdown/style_sheet'
require 'fileutils'
require 'pry'

class StyleCache
  attr_accessor :style_data
  attr_accessor :tmp
  attr_accessor :latest_file

  def initialize
    @latest_file = File.join(File.dirname(File.expand_path(__FILE__)), "cache/latest_styles.txt")
  end


  def get_css_links
    load_latest_files
  end

  def save_links links
    links.each do |link|
      link.download_content
    end
    create_tmp_file
    write_link_cache_file links
    write_link_contents links
    remove_old_files

  end

  def create_tmp_file
    @tmp = get_cache_file "tmp.txt"
    FileUtils.touch tmp
  end

  def write_link_cache_file links
    @style_data = ""
    links.each do |link|
      style_data << "#{link.name},#{link.url}\n"
    end
    File.open( tmp, 'w') {|f| f.write( style_data ) }
  end

  def write_link_contents links
    links.each do |link|
      style_file = get_cache_file link.name
      FileUtils.touch style_file
      File.open(style_file, 'w') {|f| f.write( link.content ) }
    end
  end

  def remove_old_files
    prev_sheets = load_latest_files
    prev_sheets.each do |sheet|
      FileUtils.rm(get_cache_file( sheet.name ))
    end
    File.open( @latest_file, 'w') {|f| f.write( style_data ) }
    FileUtils.rm tmp
  end

  def get_cache_file name
    File.join(File.dirname(File.expand_path(__FILE__)), "cache/#{name}")
  end
    
  def load_latest_files
    cached_links = []
    File.readlines( @latest_file ).each do |line|
      contents = line.split(",")
      ss = StyleSheet.new
      ss.name = contents[0]
      ss.url = contents[1]

      cached_links << ss
    end
    cached_links
  end
 



end
