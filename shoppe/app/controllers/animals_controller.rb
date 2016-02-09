class AnimalsController < ApplicationController

  def index
  end

  def create
    @category = Category.find(params[:category_id])
    @animal = @category.animals.create(animal_params)
    redirect_to category_path(@category)
  end

  def new
  end

  def edit
    @category = Category.find(params[:category_id])
    @animal = @category.animals.find(params[:id])
  end

  def show
  end

  def update
    @category = Category.find(params[:category_id])
    @animal = @category.animals.find(params[:id])

    if @animal.update(animal_params)
      redirect_to category_path(@category)
    else
      render 'edit'
    end

  end

  def destroy
    @category = Category.find(params[:category_id])
    @animal = @category.animals.find(params[:id])
    @animal.destroy
    redirect_to category_path(@category)
  end

private

  def animal_params
    params.require(:animal).permit(:name, :species, :details, :price)
  end

end
