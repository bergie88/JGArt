class PagesController < ApplicationController
  def home
  	@posts = Blog.all
  	@portfolio_items = Portfolio.all
  end

  def about
  end

  def contact
  end
end
