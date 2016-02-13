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
    to_delete = User.find(current_user.id).orders.where(item_quantity: 0)
    Order.delete(to_delete)
    @cart = User.find(current_user.id).orders.where(checked_out: false).order(:created_at)
    if request.xhr?
      render 'cart', layout: false
    end
  end

  def add_to_cart
    if order = Order.find_by(animal_id: params[:id], checked_out: false)
      quantity = order.item_quantity
      order.update(item_quantity: quantity + 1)
    else
      Order.create(animal_id: params[:id], user_id: current_user.id, item_quantity: 1)
    end
    if request.xhr?
      @cart = User.find(current_user.id).orders.where(checked_out: false).order(:created_at)
      render 'cart', layout: false
    end
  end

  def profile
    user_orders = Order.where(user_id: 1, checked_out: true)
    user_order_nums = []
    user_orders.each do |order|
      user_order_nums << order.order_num
    end
    user_order_nums = user_order_nums.uniq.sort.reverse

    @array_of_orders = []
    user_order_nums.each do |num|
      @array_of_orders << Order.where(order_num: num)
    end
  end

end
