require 'rubygems'
require 'mixlib/cli'

class CliParser
  include Mixlib::CLI

  option :output,
    :short => "-o OUTPUT",
    :long => "--output OUTPUT",
    :description => "Name of the file to write the converted markdown into"

  option :wrap,
    :short => "-w",
    :long => "--wrap",
    :description => "Wrap the markdown in html and add styles",
    :boolean => true


  def run(argv=ARGV)
    parse_options(argv)
  end
end
