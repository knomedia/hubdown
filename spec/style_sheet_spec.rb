require 'spec_helper'

describe StyleSheet do

  it "outputs a proper tag" do
    sh = StyleSheet.new
    sh.name = "test.css"
    sh.url = "http://localhost:3000/styles"
    tag = sh.to_tag
    tag.should eq '<link href="http://localhost:3000/styles/test.css" media="screen" rel="stylesheet" type="text/css">'
  end

  it "strips attributes from a given tag" do
    sh = StyleSheet.new
    sh.from_tag "<link href=\"https://a248.e.akamai.net/assets.github.com/assets/github-6c7984e384129edf1958345326c26471eedcdc23.css\" media=\"screen\" rel=\"stylesheet\" type=\"text/css\">\n"

    sh.name.should eq "github-6c7984e384129edf1958345326c26471eedcdc23.css"
    sh.url.should eq "https://a248.e.akamai.net/assets.github.com/assets"
  end

  it "loads web content" do
    sh = StyleSheet.new
    sh.from_tag '<link href="http://dev.knomedia.com/hubdown_css/test.css" media="screen" rel="stylesheet" type="text/css">'
    sh.download_content
    sh.content.should eq "body { margin: 0; }"
  end

end
