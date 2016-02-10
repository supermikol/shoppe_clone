class NavigationController < ApplicationController

  def home
    @categories = Category.all
  end

  def categories
    @category = Category.find(params[:id])
    if request.xhr?
      @admin = false
      render 'show', layout: false
    end
  end

end
