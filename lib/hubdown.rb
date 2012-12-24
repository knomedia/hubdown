require 'hubdown/version'
require 'github/markdown'

module Hubdown
  # Your code goes here...
end

file_name = ARGV[0]
#output_file_name = ARGV[1] ||"#{file_name.split('.')[0]}.html"
output_file_name = ARGV[1]

css_links = [];
css_links << "https://a248.e.akamai.net/assets.github.com/assets/github-8dd5c1a834790ecb6b900ff7b2d9a1377fd5aef1.css"
css_links << "https://a248.e.akamai.net/assets.github.com/assets/github2-4591451faf42b997173d752065f048736e6f9872.css"

opening = <<EOF
<!DOCTYPE html>
<html>
<head>
  <title>#{output_file_name}</title>
  <link href="https://a248.e.akamai.net/assets.github.com/assets/github-8dd5c1a834790ecb6b900ff7b2d9a1377fd5aef1.css" media="screen" rel="stylesheet" type="text/css" />
  <link href="https://a248.e.akamai.net/assets.github.com/assets/github2-4591451faf42b997173d752065f048736e6f9872.css" media="screen" rel="stylesheet" type="text/css" />
  <style>
    #wrapper {
      width: 920px;
      margin: 20px auto;
    }
  </style>
</head>

<body>
  <div id="wrapper">
  <div id="slider">
    <div class="frames">
      <div class="frame">
        <div id="readme" class="clearfix announce instapaper_body md">
          <span class="name">#{file_name}</span>
          <article class="markdown-body entry-content">
EOF

closing = <<EOF
          </article>
        </div>
      </div>
    </div>
  </div>
  </div>
</body>
</html>
EOF

readme = GitHub::Markdown.render_gfm File.read(file_name)
file_contents = "#{opening}#{readme}#{closing}" 

if (output_file_name)
  File.open( output_file_name, "w") { |f| f.write file_contents }
  puts "... created: #{output_file_name}"
else
  puts file_contents
end
