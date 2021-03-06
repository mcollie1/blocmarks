Blocmarks::Application.routes.draw do
  
  devise_for :users

  resources :users, only: [:show, :update]

  post :incoming, to: 'incoming#create'

  resources :bookmarks, only: [:index, :show, :destroy] do
    resources :urls, only: [:show, :destroy] do
      get '/like-vote' => 'votes#like_vote', as: :like_vote
      get '/unlike-vote' => 'votes#unlike_vote', as: :unlike_vote
    end
  end

  use_link_thumbnailer

  match "about", to: 'welcome#about', via: :get 

  root to: 'welcome#index'
end
