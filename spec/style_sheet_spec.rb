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
    sh.from_tag "<link href=\"https://assets-cdn.github.com/assets/github-da7475c114a3c2eab7b91a0584202a89fd188935.css\" media=\"all\" rel=\"stylesheet\" type=\"text/css\">"

    sh.name.should eq "github-da7475c114a3c2eab7b91a0584202a89fd188935.css"
    sh.url.should eq "https://assets-cdn.github.com/assets"
  end

  it "loads web content" do
    sh = StyleSheet.new
    sh.from_tag '<link href="https://pa.jskdev.xyz/test.css" media="screen" rel="stylesheet" type="text/css">'
    sh.download_content
    sh.content.should eq "body { margin: 0; }\n"
  end

end
