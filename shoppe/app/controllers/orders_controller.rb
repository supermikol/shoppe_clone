class OrdersController < ApplicationController
  $ordernum = 1

  def update
    order = Order.find(params[:id])

    order.update(item_quantity: params[:order][:item_quantity])
    redirect_to "/cart"
  end

  def checkout
    # if Order.find(:all, :conditions => "order.order_num IS NOT NULL")
    #   order_num = Order.last.order_num + 1
    # else
    #   order_num = 1
    # end
    orders = Order.where(user_id: current_user.id, checked_out: false)
    orders.each do |order|
      order.checked_out = true
      order.checkout_date = DateTime.now
      order.order_num = $ordernum
      order.save
      p order
    end
      $ordernum += 1

    redirect_to "/checkout"
  end

  def checkout_complete
    @orders = Order.where(user_id: current_user.id, checked_out: true)
    render "checkout"
  end
end
