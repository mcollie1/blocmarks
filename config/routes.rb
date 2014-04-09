Blocmarks::Application.routes.draw do
  
  devise_for :users

  resources :users, only: [:show, :update]

  post :incoming, to: 'incoming#create'

  post '/emails' => 'emails#create'

  resources :bookmarks do
    get '/like-vote' => 'votes#like_vote', as: :like_vote
    get '/unlike-vote' => 'votes#unlike_vote', as: :unlike_vote
    member do
      get 'like'
    end
  end

  use_link_thumbnailer

  match "about", to: 'welcome#about', via: :get 

  root to: 'welcome#index'
end
