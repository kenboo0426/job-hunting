require 'nokogiri'
require 'open-uri'

module Crawler
  class Configuration

    attr_accessor :host, :site_name, :index_urls

    def initialize
      @host = nil
      @site_name = nil
      @index_urls = nil
    end
  end

  class DefaultCrawler
    attr_accessor :host, :site_name, :index_urls, :docs

    def initialize
      conf = self.class.configuration
      @index_urls = conf.index_urls
      @docs = fetch_doc
      @host = conf.host
      @site_name = conf.site_name
    end
      
    def self.configuration
      @configuration ||= Configuration.new
    end

    def self.configure
      yield configuration if block_given?
    end

    self.configure do |c|
      c.host = 'example.com'
      c.site_name = 'example'
      c.index_urls = [
        'https://example.com/example',
      ]
    end

    def fetch_doc
      charset = nil
      html = open(index_urls) do |f|
        charset = f.charset # 文字種別を取得
        f.read # htmlを読み込んで変数htmlに渡す
      end
      parse_html(html, charset)
    end
    
    # htmlをパース(解析)してオブジェクトを生成
    def parse_html(html, charset)
      Nokogiri::HTML.parse(html, nil, charset)
    end

    def fetch_unsaved_articles_info
      articles_docs = select_articles
      set_params(articles_docs)
    end

    def set_params(articles_docs)
      articles_params = articles_docs.map do |element|
        {
          url: fetch_url(element),
          title: fetch_title(element),
          company_name: fetch_company_name(element)
        }
      end
    end

  end

end