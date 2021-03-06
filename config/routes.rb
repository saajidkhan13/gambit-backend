Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/stocks/chart/:id', to: 'stocks#chart'
      get '/stocks/chart/:id/5y', to: 'stocks#five_year'
      get '/stocks/chart/:id/2y', to: 'stocks#two_year'
      get '/stocks/chart/:id/1y', to: 'stocks#one_year'
      get '/stocks/chart/:id/ytd', to: 'stocks#ytd'
      get '/stocks/chart/:id/6m', to: 'stocks#six_month'
      get '/stocks/chart/:id/3m', to: 'stocks#three_month'
      get '/stocks/chart/:id/1m', to: 'stocks#one_month'
      get '/stocks/chart/:id/1d', to: 'stocks#one_day'
      get '/stocks/:id/news', to: 'stocks#news'
      get '/stocks/:id/company', to: 'stocks#company_info'
      get '/stocks/:id/stats', to: 'stocks#stats'
      get '/markets', to: 'stocks#markets'





      get '/stocks/price/:id', to: 'stocks#price'
      get '/stocks/tickers', to: 'stocks#tickers'
      get '/stocks/gainers-losers', to: 'stocks#gainers_losers'
      get '/stocks/sectors', to: 'stocks#sector_performance'


      resources :users, only: [:create, :index, :show, :update]
      post '/login', to: 'auth#create'
      get '/dashboard', to: 'users#profile'
      get '/profile', to: 'auth#show_user'
      resources :portfolios
      post '/portfolios', to: 'portfolio#create'
    end
  end
end
