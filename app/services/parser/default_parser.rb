module Parser
  class Configuration

    attr_accessor :host, :site_name
    def initialize
      @host = nil
      @site_name = nil
    end
  end

  class DefaultParser

    attr_accessor :host, :site_name, :doc

    def initialize(article)
      conf = self.class.configuration
      @doc = fetch_doc(article.url)
      @host = conf.host
      @site_name = conf.site_name
    end
      
    def self.configuration
      @configuration ||= Configuration.new
    end

    def self.configure
      yield configuration if block_given?
    end
    
    def fetch_doc(url)
      charset = nil
      # htmls = index_urls.map do |url|
        html = open(url) do |f|
          charset = f.charset # 文字種別を取得
          f.read # htmlを読み込んで変数htmlに渡す
        end
        parse_html(html, charset)
      # end
    end

    def caught_keyword?(article)
    end
    
    # htmlをパース(解析)してオブジェクトを生成
    def parse_html(html, charset)
      Nokogiri::HTML.parse(html, nil, charset)
    end

    def set_update_params
      {
        scraped: true,
        place: fetch_place
      }
    end

  end
end