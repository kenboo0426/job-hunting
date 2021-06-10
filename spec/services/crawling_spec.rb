require 'rails_helper'
require 'nokogiri'
require 'open-uri'

describe "クローリング" do
  it "キャリアバイト" do
    url = "https://careerbaito.com/search"
    charset = nil
    html = open(url) do |f|
      charset = f.charset
      f.read 
    end

    doc = Nokogiri::HTML.parse(html, nil, charset)
    expect(doc).to be_present
  end

  it "ウォンテッドリー" do
    url = "https://www.wantedly.com/projects"
    charset = nil
    html = open(url) do |f|
      charset = f.charset
      f.read 
    end

    doc = Nokogiri::HTML.parse(html, nil, charset)
    expect(doc).to be_present
  end
  
end