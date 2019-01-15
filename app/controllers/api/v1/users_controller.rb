class Api::V1::UsersController < ApplicationController
  skip_before_action :authorized, only: %i[create]
  before_action :find_user, only: [:show, :edit, :update]

    def index
      @users = User.all
      render json: @users
    end

    def show
      @user = User.find(params[:id])
      render json: @user, status: 200
    end

    def new
      @user = User.new
    end

    def dashboard
      render json: { user: UserSerializer.new(current_user) }, status: :accepted
    end

    def create
      @user = User.create(user_params)
      if @user.valid?
        @token = encode_token(user_id: @user.id)
        render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created
      else
        render json: { error: 'failed to create user' }, status: :not_acceptable
      end
    end


    def update
      @user.update(user_params)
      if @user.save
        render json: @user, status: :accepted
      else
        render json: { errors: @user.errors.full_messages }, status: :unprocessible_entity
      end
    end

    private

    def user_params
      params.require(:user).permit(:name, :email, :password, :funds, :address)
    end

    def find_user
      @user = User.find(params[:id])
    end

  end # End of controller
