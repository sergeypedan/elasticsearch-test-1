class SearchController < ApplicationController

  def testsearch
    if params[:q].nil?
      @articles = []
    else
      @articles = Article.search params[:q]
    end
    @articles ||= []
  end

end
