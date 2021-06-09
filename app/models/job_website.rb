class JobWebsite < ApplicationRecord
  def host
    URI.parse(url).host
  end
end
