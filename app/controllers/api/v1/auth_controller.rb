class Api::V1::AuthController < ApplicationController
  skip_before_action :authorized, only: %i[create]

  def create
    @user = User.find_by(name: user_login_params[:name])
    #User#authenticate comes from BCrypt
    # byebug

    if @user && @user.authenticate(user_login_params[:password])
      # encode token comes from ApplicationController
      token = encode_token({ user_id: @user.id })

      render json: { user: UserSerializer.new(@user), jwt: token }, status: :accepted
    else
      render json: { message: 'Invalid username or password' }, status: :unauthorized
    end
  end

private

  def user_login_params
    params.require(:user).permit(:name, :password)
  end
end
