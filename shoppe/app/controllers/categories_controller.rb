class CategoriesController < ApplicationController
  before_action :require_admin


  def index
    @categories = Category.all
  end


  def create
    @category = Category.new(category_params)

    if @category.save
      flash[:success] = ['Category Created!']
      redirect_to categories_path
    else
      flash.now[:warning] = @category.errors.full_messages
      render 'form'
    end
  end

  def new
    @category = Category.new
    if request.xhr?
      render 'new', layout: false
    end
  end

  def edit
    @category = Category.find(params[:id])
    if request.xhr?
      render 'edit', layout: false
    end
  end

  def show
    @admin = true
    @category = Category.find(params[:id])
    if request.xhr?
      render 'show', layout: false
    end
  end

  def update
    @category = Category.find(params[:id])

    if @category.update(category_params)
      flash[:success] = ['Category Updated!']
      redirect_to categories_path
    else
      flash.now[:warning] = @category.errors.full_messages
      render 'edit'
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy

    redirect_to categories_path
  end

private
  def category_params
    params.require(:category).permit(:name)
  end

  def require_admin
    unless current_user.admin
      flash[:error] = "You must be an admin to access this section"
      redirect_to "/"
    end
  end



end
