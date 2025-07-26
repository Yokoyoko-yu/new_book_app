Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  #ユーザ
  resources :users,only: [:create]

  
  #Userbook
  resources :user_books,only: [:index, :create, :destroy] do
    get 'exists/:isbn', to: 'user_books#exists', on: :collection
  end

  #awards
  resources :awards,only: [:index,:show]

  #award_grants
  get "/award_grants/search",to:'award_grants#search'



  #sessions
  get '/login',to:'sessions#new'
  post '/login',to:'sessions#create'
  delete '/logout',to:'sessions#destroy'
  get '/current_user',to:'sessions#user',defaults: { format: :json }
  
  #award_titles
  resources :award_titles,only: [:show]

  get '/home',to:'static_page#home'



end

