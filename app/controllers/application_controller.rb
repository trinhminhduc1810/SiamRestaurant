class ApplicationController < ActionController::Base
  protect_from_forgery

  def current_cart
    Cart.find(session[:card_id])
    rescue ActiveRecord::RecordNotFound
      cart = Cart.create
      session[:cart_id] = cart.id
      return cart
    end
  end

  def create_user(infor)
    user = User.new()
    user.name = infor[:name]
    user.username = infor[:username]
    user.email = infor[:email]
    user.address = infor[:address]
    hash = user.hash_password(infor[:password])
    confirm_hash = user.hash_password(infor[:confirm_password])
    user.password = hash
    user.old_password = hash
    user.confirm_password = confirm_hash
    return user
  end

  def check_old_pass_user(user,old_password)
    original_infor = {
      :name => "",
      :username => "",
      :email => "",
      :address => "",
      :password => "",
      :confirm_password => "",
      :old_password => ""
    }
    original_infor[:name] = user.name
    original_infor[:username] = user.username
    original_infor[:email] = user.email
    original_infor[:address] = user.address
    original_infor[:password] = user.password
    original_infor[:confirm_password] = user.password
    original_infor[:old_password] = user.hash_password(old_password)
    return original_infor
  end

  def update_user(infor)
    user = User.new()
    infor[:password] = user.hash_password(infor[:password])
    infor[:confirm_password] = user.hash_password(infor[:confirm_password])
    infor[:old_password] = infor[:password]
    return infor
  end
end
