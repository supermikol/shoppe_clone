class AnimalsController < ApplicationController
  before_action :require_admin

  def index
  end

  def create
    params[:animal][:category_ids].delete("")
    @animal = Animal.new(animal_params)
    params[:animal][:category_ids].each do |cat_id|
      @animal.categories << Category.find(cat_id)
    end

    if @animal.save
      flash[:success] = ['Animal is Born!']
      redirect_to categories_path
    else
      flash[:warning] = @animal.errors.full_messages
      render 'new'
    end

  end

  def new
    @categories = Category.all
    @animal = Animal.new
    if request.xhr?
      render '_form', layout: false
    else
      render '_form'
    end
  end

  def edit
    @animal = Animal.find(params[:id])
  end

  def show
  end

  def update
    @animal = Animal.find(params[:id])
    params[:animal][:category_ids].delete("")
    @animal.categories.clear
    params[:animal][:category_ids].each do |cat_id|
      @animal.categories << Category.find(cat_id)
    end

    if @animal.update(animal_params)
      flash[:success] = ['Animal is updated!']
      redirect_to categories_path
    else
      flash.now[:warning] = @animal.errors.full_messages
      render 'edit'
    end

  end

  def destroy
    @animal = Animal.find(params[:id])
    @animal.categories = []
    @animal.delete
    redirect_to categories_path
  end

private

  def animal_params
    params.require(:animal).permit(:name, :quantity, :img_url, :species, :details, :price, :category_ids)
  end

  def require_admin
    unless current_user.admin
      flash[:error] = "You must be an admin to access this section"
      redirect_to "/"
    end
  end
end
