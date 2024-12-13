Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/home',to:'static_page#home'
  resources :users
  root to:'static_page#sign_in'
  get '/login',to:'sessions#new'
  post '/login',to:'sessions#create'
  delete '/logout',to:'sessions#destroy'
  resources :my_books
  get 'awards',to:'literary_awards#show'
  get 'check',to:'literary_awards#check'
  get '/literary_awards/have_book/:id',to:'literary_awards#have_book',as:'have_book'
  get '/literary_awards/read_book/:id',to:'literary_awards#read_book',as:'read_book'
  get '/current_user',to:'sessions#user',defaults: { format: :json }
  resources :my_books do
    member do
      get 'finish'
    end
  end
end

