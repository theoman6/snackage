class StaticPagesController < ApplicationController

  def home
    @order = Order.new
    if user_signed_in? 
      last_order = current_user.orders.last
      @items = !current_user.orders.all.blank? ? current_user.orders.last.choices : nil
      if last_order.nil?
        @order[:phone_number] = current_user.phone_number
        @order[:house_dorm] = current_user.house_dorm
        @order[:room] = current_user.room
        @order[:address] = current_user.address
        @order[:city] = current_user.city
        @order[:state] = current_user.state
        @order[:zip] = current_user.zipcode
      else
        @order = last_order
        @order[:id] = nil
      end
    end
  end
  
  def about 
  end

  def help
  end
  
  def destroy
  end
 
end
