class WelcomeController < ApplicationController
	respond_to :html
	
  def index
    @articles = Article.all.order(created_at: :desc).limit(5)
    respond_with(@articles)
  end
end
