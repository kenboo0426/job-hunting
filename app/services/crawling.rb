require 'nokogiri'
require 'open-uri'

class Crawling

  def initialize
    @crawlers = get_crawlers
  end

  def run
    @crawlers.each do |crawler|
      articles_info = crawler.fetch_unsaved_articles_info
      #hash
      articles_info.each do |article_info|
        begin
          JobWebsite.create(article_info)
        rescue => e
          p "#{crawler.site_name}  #{e}"
        end
      end
    end
  end

  def get_crawlers
    crawler_names = []
    Dir.foreach("app/services/crawler") do |file|
      next if file.include?("default_crawler.rb") || file == "." || file == ".."
      class_name = file.gsub(".rb","").classify
      crawler_names << class_name
    end
    crawler_names.map {|crawler| "Crawler::#{crawler}".constantize.new }
  end

end