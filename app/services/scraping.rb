require 'nokogiri'
require 'open-uri'

class Scraping

  def initialize
    @should_scraping_articles = JobWebsite.where(scraped: false)
    @parsers = set_all_parsers
  end

  def run 
    @should_scraping_articles.each do |article|
      begin
        parser = find_parser(article).new(article)
        update_params = parser.set_update_params
        article.update(update_params)
        next unless parser.is_valid_keyword?
        SlackNotifier.notifier_job_offer(url: article.url, job_header: article.title)
      rescue => e
        p e
      end
    end
  end

  def find_parser(article)
    
    @parsers.find { |parser| parser.configuration.host.include?(article.host) }
  end

  def set_all_parsers
    parser_names = []
    Dir.foreach("app/services/parser") do |file|
      next if file.include?("default_parser.rb") || file == "." || file == ".."
      class_name = file.gsub(".rb","").classify
      parser_names << class_name
    end
    parser_names.map {|parser| "Parser::#{parser}".constantize }
  end

end