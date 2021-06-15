class ArticlesController < ApplicationController

  def index
    @articles = Article.search(search_word)

  end

  private

    def search_word
      @search_word ||= params[:keyword]
    end

end
