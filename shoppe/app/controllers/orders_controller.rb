class OrdersController < ApplicationController

  def update
    order = Order.find(params[:id])

    order.update(item_quantity: params[:order][:item_quantity])
    redirect_to "/cart"
    # end

  end

  def checkout
    order_num = (Order.all.where.not('order_num' => nil).max_by {|x| x.order_num}.order_num + 1)
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

end
