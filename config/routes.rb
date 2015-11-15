Rails.application.routes.draw do
  get '/home', to: 'pages#home'
  root 'pages#home'
  
  
  resources :sermons do
    member do
      post 'like'
      post "review"
      
    end
    
  end
  resources :reviews, only: [:destroy]
  
  resources :pastors, except: [:new, :destroy]
  get '/register', to: 'pastors#new'
    
 get '/login', to: "logins#new"
 post '/login', to: "logins#create"
 get '/logout', to: "logins#destroy"
 
 
 
 resources :topics, only: [:new, :create, :show]
 resources :categories, only: [:new, :create, :show]
  
end
