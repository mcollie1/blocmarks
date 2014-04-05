Blocmarks::Application.routes.draw do
  devise_for :users

  post :incoming, to: 'incoming#create'
  get :incoming, to: 'incoming#index'

  resources :bookmarks

  match "about", to: 'welcome#about', via: :get 

  root to: 'welcome#index'
end
