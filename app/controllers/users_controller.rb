class UsersController < ApplicationController
  def sign_up
    render json: { page: 'signup' }, status: :ok
  end
end