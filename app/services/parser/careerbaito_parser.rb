module Parser
  class CareerbaitoParser < DefaultParser

    KEYWORDS = %w(Rails rails Ruby ruby)

    self.configure do |c|
      c.host = 'https://careerbaito.com'
      c.site_name = 'Careerbaito'
    end

    def fetch_place
      doc.css('.contents .jobView_top .jobView_top_box_detail_item li')[1].css('span span').text.gsub("\n", "").gsub(' ', "")
    end

    def is_valid_keyword?
      text = doc.css('.contents_main').text
      KEYWORDS.any? {|keyword| text.include?(keyword)}
    end

  end
end