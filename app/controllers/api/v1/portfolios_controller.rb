class Api::V1::PortfoliosController < ApplicationController
  before_action :find_portfolio, only: [:update, :show]

  def index
    @portfolios = Portfolio.all
    render json: @portfolios
  end

  def new
    @user = User.new
  end

  def show
    @portfolio = Portfolio.find(params[:id])
    render json: @portfolio, status: 200
  end

  def update
    @portfolio.update(portfolio_params)
    if @portfolio.save
      render json: @portfolio, status: :accepted
    else
      render json: { errors: @portfolio.errors.full_messages }, status: :unprocessible_entity
    end
  end

  def destroy
    @portfolio.destroy
    render json: {message: 'Portfolio has been deleted'}
  end

  private

  def portfolio
    params.require(:portfolio).permit(:user_id, :name, :symbol, :price_when_purchased, :amount, :sector, :date_bought)
  end

  def find_portfolio
    @portfolio = Portfolio.find(params[:id])
  end

end # End of controller
