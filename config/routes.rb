Rails.application.routes.draw do
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  resources :users, only: [:new, :create] do
    member do
      get :likes
    end
  end
  
  
  resources :folders do
    member do
      #get :questions
      get :answers
    end
  end
    
  resources :quizzes, only: [:new, :create, :edit, :update, :destroy ]
  resources :favorites, only: [:create, :destroy]
end
