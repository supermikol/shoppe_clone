class NavigationController < ApplicationController

  def home
    @categories = Category.all
  end

  def all
    @animals = Animal.all
    if request.xhr?
      @admin = false
      render 'show', layout: false
    end
  end

  def categories
    @category = Category.find(params[:id])
    @animals = @category.animals
    if request.xhr?
      @admin = false
      render 'show', layout: false
    end
  end

end
