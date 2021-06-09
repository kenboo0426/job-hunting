module Crawler
  class WantedlyCrawler < DefaultCrawler

    # KEYWORDS = %w(NPO NGO 国際協力 子ども 保育 介護 福祉 地域活性化 まちづくり 地方創生 農業 スポーツ 動物 ボランティア)

    self.configure do |c|
      c.host = 'https://www.wantedly.com'
      c.site_name = 'Wantedly'
      c.index_urls = "https://www.wantedly.com/projects?type=recent&page=1&occupation_types%5B%5D=jp__engineering&hiring_types%5B%5D=internship&fields%5B%5D=jp__web_engineer&locations%5B%5D=osaka&locations%5B%5D=kyoto"
    end

    def select_articles
      docs.css('.new-style article')
    end

    def fetch_url(element)
      sub_url = element.css('a').first[:href].split("?")[0]
      "#{host}#{sub_url}"
    end

    def fetch_company_name(element)
      element.css('.company-name h3 a').text
    end

    def fetch_title(element)
      element.css('h1.project-title a').text
    end


  end
end