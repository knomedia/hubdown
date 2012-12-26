module Hubdown
  class PageBuilder
    
    def initialize body
      @body = body
    end

    def get_page
      page = "#{get_head}#{@body}#{get_closing}"
      page      
    end

    def get_head
    opening = <<EOF
<!DOCTYPE html>
<html>
<head>
  <title>OUTPUT</title>
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
          <span class="name">FILE_NAME</span>
          <article class="markdown-body entry-content">
EOF
    end

    def get_closing
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
    end
  end
end
