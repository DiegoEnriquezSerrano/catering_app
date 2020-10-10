class UsersController < ApplicationController

  def sign_up
  end

  def sign_up_caterer
  end

  def login
  end

  def caterers
    @users = User.where(caterer_user: true)
    render json: @users.as_json(only: [:id, :caterer_business_name])
  end

end