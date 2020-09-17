class UsersController < ApplicationController
  def show
    @nickname = current_user.nickname
    @products = current_user.products
  end
end
