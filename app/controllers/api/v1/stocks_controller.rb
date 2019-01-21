class Api::V1::StocksController < ApplicationController
  before_action :base

   def base
     @url="https://api.iextrading.com/1.0/"
   end

   def chart
    new_url = "#{@url}stock/#{params[:id]}/chart"
    results = JSON.parse(RestClient.get(new_url))
    render json: results, status: :ok
   end

   def five_year
     new_url="https://api.iextrading.com/1.0/stock/#{params[:id]}/chart/5y"
     results = JSON.parse(RestClient.get(new_url))
     render json: results, status: :ok
   end

   def two_year
     new_url="https://api.iextrading.com/1.0/stock/#{params[:id]}/chart/2y"
     results = JSON.parse(RestClient.get(new_url))
     render json: results, status: :ok
   end

   def one_year
     new_url="https://api.iextrading.com/1.0/stock/#{params[:id]}/chart/1y"
     results = JSON.parse(RestClient.get(new_url))
     render json: results, status: :ok
   end

   def ytd
     new_url="https://api.iextrading.com/1.0/stock/#{params[:id]}/chart/ytd"
     results = JSON.parse(RestClient.get(new_url))
     render json: results, status: :ok
   end

   def six_month
     new_url="https://api.iextrading.com/1.0/stock/#{params[:id]}/chart/6m"
     results = JSON.parse(RestClient.get(new_url))
     render json: results, status: :ok
   end

   def three_month
     new_url="https://api.iextrading.com/1.0/stock/#{params[:id]}/chart/3m"
     results = JSON.parse(RestClient.get(new_url))
     render json: results, status: :ok
   end

   def one_month
     new_url="https://api.iextrading.com/1.0/stock/#{params[:id]}/chart/1m"
     results = JSON.parse(RestClient.get(new_url))
     render json: results, status: :ok
   end

   def one_day
     new_url="https://api.iextrading.com/1.0/stock/#{params[:id]}/chart/1d"
     results = JSON.parse(RestClient.get(new_url))
     render json: results, status: :ok
   end

   def news
     new_url="https://api.iextrading.com/1.0/stock/#{params[:id]}/news"
     results = JSON.parse(RestClient.get(new_url))
     render json: results, status: :ok
   end

   def company_info
     new_url="https://api.iextrading.com/1.0/stock/#{params[:id]}/company"
     results = JSON.parse(RestClient.get(new_url))
     render json: results, status: :ok
   end


  def price
   new_url = "#{@url}stock/#{params[:id]}/price"
   result = RestClient.get(new_url)
   new_url2 = "#{@url}stock/#{params[:id]}/quote?filter=close"
   result2 = JSON.parse(RestClient.get(new_url2))
   render json: {"price":result, "start":result2["close"]}, status: :ok
  end

   def tickers
    new_url = "#{@url}ref-data/symbols?filter=symbol,name"
    results = JSON.parse(RestClient.get(new_url))
    formatted = results.each_with_index.map do |result,index|
      {key:index,"title":"#{result["name"]} - #{result["symbol"]}", "symbol":result["symbol"]}
    end
    render json: formatted, status: :ok
  end

  def gainers_losers
    gainer_url= "#{@url}stock/market/list/gainers"
    loser_url= "#{@url}stock/market/list/losers"
    gainer_result = JSON.parse(RestClient.get(gainer_url))
    loser_result = JSON.parse(RestClient.get(loser_url))
    gainer_formatted = gainer_result.map{|gainer| {symbol: gainer['symbol'], name: gainer['companyName'], change: (gainer['changePercent']*100).to_f.round(2), price: gainer['latestPrice'].to_f.round(2)}}.sort_by{|gainer| gainer[:change]}.reverse!
    loser_formatted = loser_result.map{|loser| {symbol: loser['symbol'], name: loser['companyName'], change: (loser['changePercent']*100).to_f.round(2), price: loser['latestPrice'].to_f.round(2)}}.sort_by{|loser| loser[:change]}
    render json: {gainers: gainer_formatted, losers:loser_formatted}, status: :ok
  end

  def sector_performance
    sector_url = "#{@url}stock/market/sector-performance"
    sector_results = JSON.parse(RestClient.get(sector_url))
    sector_results = sector_results.sort_by{|obj| obj['performance']}.reverse!
    render json: {sector: sector_results}, status: :ok
  end






end
