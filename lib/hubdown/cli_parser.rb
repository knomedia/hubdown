require 'rubygems'
require 'mixlib/cli'

class CliParser
  include Mixlib::CLI

  option :output,
    :short => "-o OUTPUT",
    :long => "--output OUTPUT",
    :description => "Name of the file to write the converted markdown into"

  option :preview,
    :short => "-p",
    :long => "--preview",
    :description => "Displays the output markdown in a browser",
    :boolean => true


  def run(argv=ARGV)
    parse_options(argv)
  end
end
