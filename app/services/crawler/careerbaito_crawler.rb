module Crawler
  class CareerbaitoCrawler < DefaultCrawler

    self.configure do |c|
      c.host = 'https://careerbaito.com'
      c.site_name = 'Careerbaito'
      c.index_urls = "https://careerbaito.com/search/295/305"
    end

    def select_articles
      docs.css('.contentsArea .viewingDays')
    end

    def fetch_url(element)
      sub_url = element.css('a.tapArea').first[:href].split('&').last
      "#{host}/#{sub_url}"
    end

    def fetch_company_name(element)
      element.css('.summaryList_detail_company').text
    end

    def fetch_title(element)
      element.css('h3.summaryList_ttl').text.gsub(" ", "").gsub("\n", "")
    end

  end
end