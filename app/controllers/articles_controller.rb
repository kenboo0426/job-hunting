class ArticlesController < ApplicationController
  def index
    @articles = JobWebsite.all
  end

  def show
  end
end
