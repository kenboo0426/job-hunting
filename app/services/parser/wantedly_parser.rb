module Parser
  class WantedlyParser < DefaultParser

    KEYWORDS = %w(Rails rails Ruby ruby)

    self.configure do |c|
      c.host = 'https://www.wantedly.com'
      c.site_name = 'Wantedly'
    end

    def fetch_place
      doc.at_css('.two-column .column-side .company-info-list .wt-icon-location').next_element.text.strip
    end

    def is_valid_keyword?
      text = doc.css('.column-main .js-descriptions').text
      KEYWORDS.any? {|keyword| text.include?(keyword)}
    end

  end
end