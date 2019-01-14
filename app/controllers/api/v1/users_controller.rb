class Api::V1::UsersController < ApplicationController
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

    def create
      @user = User.create(user_params)

      if @user.valid?
        render json: { user: UserSerializer.new(@user) }, status: :created
      else
        render json: { message: 'Username already taken' }, status: :not_accepted
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

      params.require(:user).permit(:name, :email, :password, :password_digest, :funds, :address)
    end

    def find_maker
      @user = User.find(params[:id])
    end

  end # End of controller
