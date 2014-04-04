Blocmarks::Application.routes.draw do
  resources :topics

  match "about", to: 'welcome#about', via: :get 

  root to: 'welcome#index'
end
