class NavigationController < ApplicationController

  def home
    @categories = Category.all
  end

  def all
    @animals = Animal.all.order(price: :asc)
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

  def cart
    @cart = User.find(current_user.id).orders.where(checked_out: false)
  end

  def add_to_cart
    if order = Order.find_by(animal_id: params[:id], checked_out: false)
      quantity = order.item_quantity
      order.update(item_quantity: quantity + 1)
    else
      Order.create(animal_id: params[:id], user_id: current_user.id, item_quantity: 1)
    end
    redirect_to '/cart'
  end

end
