Blocmarks::Application.routes.draw do
  
  match "about", to: 'welcome#about', via: :get 

  root to: 'welcome#index'
end
