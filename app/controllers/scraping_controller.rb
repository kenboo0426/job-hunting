class ScrapingController < ApplicationController
  def index
    crawler_names = []
    Dir.foreach("app/services/crawler") do |file|
      next unless file.include?("_crawler.rb")
      class_name = file.gsub(".rb","").classify
      crawler_names << class_name
    end

    aaa = crawler_names.map do |crawler|
      "Crawler::#{crawler}".constantize
    end
    byebug
  end
end
