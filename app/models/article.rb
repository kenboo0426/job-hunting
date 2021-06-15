class Article < ApplicationRecord
  update_index('articles') {  self  }

  def self.search(search_word)
    search_word.present? ? ArticlesIndex.query(query_string: { fields: [:title, :place, :company_name], query: search_word}).to_a : Article.all
  end 

  def host
    URI.parse(url).host
  end
end
