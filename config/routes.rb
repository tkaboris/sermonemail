Rails.application.routes.draw do
  get '/home', to: 'pages#home'
  root 'pages#home'
  
  
  resources :sermons do
    member do
      post 'like'
    end
  end
  resources :pastors, except: [:new]
  get '/register', to: 'pastors#new'
    
 get '/login', to: "logins#new"
 post '/login', to: "logins#create"
 get '/logout', to: "logins#destroy"
  
end
