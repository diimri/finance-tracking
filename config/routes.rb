Rails.application.routes.draw do
  resources :user_stocks
  devise_for :users
  #root 'welcome#index'
  root  'users#my_portfolio'
  get 'my_portfolio' , to: 'users#my_portfolio'
  #this is search_stock_path name connected to stocks controller and search
  get 'search_stock' , to: 'stocks#search'

  resources :stocks
end
