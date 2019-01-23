class Api::V1::PortfoliosController < ApplicationController
  before_action :find_portfolio, only: [:update, :show]

  def index
    @portfolios = Portfolio.all
    render json: @portfolios
  end

  def new
    @portfolio = Portfolio.new
  end

  def create

    @portfolio = Portfolio.create(portfolio_params)
    if @portfolio.valid?
      render json: @portfolio, status: :created
    else
      render json: { error: 'failed to create purchase' }, status: :not_acceptable
    end
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

  def portfolio_params
    params.require(:portfolio).permit(:user_id, :name, :symbol, :price_when_purchased, :amount, :sector, :date_bought)
  end

  def find_portfolio
    @portfolio = Portfolio.find(params[:id])
  end

end # End of controller
