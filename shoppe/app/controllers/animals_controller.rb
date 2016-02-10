class AnimalsController < ApplicationController
  http_basic_authenticate_with name: 'admin', password: 'secret'

  def index
  end

  def create
    @category = Category.find(params[:category_id])
    @animal = @category.animals.create(animal_params)

    if @animal.save
      flash[:success] = ['Animal is Born!']
      redirect_to category_path(@category)
    else
      flash[:warning] = @animal.errors.full_messages
      redirect_to category_path(@category)
    end

  end

  def new
    @animal = Animal.new
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
      flash[:success] = ['Animal is updated!']
      redirect_to category_path(@category)
    else
      flash.now[:warning] = @animal.errors.full_messages
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
    params.require(:animal).permit(:name, :quantity, :img_url, :species, :details, :price)
  end

end
