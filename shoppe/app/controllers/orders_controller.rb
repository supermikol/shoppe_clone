class OrdersController < ApplicationController

  def update
    order = Order.find(params[:id])
    order.update(item_quantity: params[:order][:item_quantity])
    to_delete = User.find(current_user.id).orders.where(item_quantity: 0)
    Order.delete(to_delete)
    redirect_to "/cart"
    # end

  end

  def checkout
    if Order.all.where.not('order_num' => nil).length == 0
      order_num = 1
    else
      order_num = (Order.all.where.not('order_num' => nil).max_by {|x| x.order_num}.order_num + 1)
    end
    orders = Order.where(user_id: current_user.id, checked_out: false)
    orders.each do |order|
      order.checked_out = true
      order.checkout_date = DateTime.now
      order.order_num = order_num
      order.save
    end

    redirect_to "/checkout"
  end

  def checkout_complete
    order_num = Order.where(user_id: current_user.id, checked_out: true).max_by {|x| x.order_num}.order_num
    @orders = Order.where(user_id: current_user.id, order_num: order_num, checked_out: true)
    render "checkout"
  end

  def view
    @user_orders = Order.where(user_id: current_user.id, order_num: params[:id], checked_out: true)
    if request.xhr?
      render 'view', layout: false
    end
  end

  def add_to_cart
    if order = Order.find_by(animal_id: params[:id], checked_out: false)
      quantity = order.item_quantity
      order.update(item_quantity: quantity + 1)
    else
      Order.create(animal_id: params[:id], user_id: current_user.id, item_quantity: 1)
    end
    @cart = User.find(current_user.id).orders.where(checked_out: false).order(:created_at)
    # if request.xhr?
    #   render 'navigation/cart', layout: false
    # end
  end

end
