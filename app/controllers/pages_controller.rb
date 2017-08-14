class PagesController < ApplicationController
  
  def home
    @recipes = Recipe.all
  end

  def about
  end
  
  def help
  end
  
end
