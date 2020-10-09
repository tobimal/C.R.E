Rails.application.routes.draw do
  root 'publics/homes#top'
  devise_for :admins do{
    registrations: 'admins/registrations',
    sessions: 'admins/sessions',
    passwords: 'admins/passwords'
  }
end
  devise_for :end_users do{
    registrations: 'public/end_users/registrations',
    sessions: 'public/end_users/sessions',
    passwords: 'public/end_users/passwords'
  }
end
  namespace :admins do
    resources :novels, only: [:index, :show, :edit, :destroy]
    resources :illustrations, only: [:index, :show, :edit, :destroy]
    resources :series_novels, only: [:index, :show, :edit, :destroy]
    resources :series_illusts, only: [:index, :show, :edit, :destroy]
    resources :inquiry, only: [:index, :show]
    resources :end_users, only: [:index, :show, :edit]
    resources :favorites, only: [:show]
  end

  namespace :publics do
     get "/top"=> "homes#top"
     root to: 'homes#top'
    resources :novels, only: [:index, :show, :edit, :new, :create, :update, :destroy]
    resources :illustrations, only: [:index, :show, :edit, :new, :create, :update, :destroy]
    resources :series_novels, only: [:index, :show, :edit, :create, :update, :destroy]
    resources :series_illusts, only: [:index, :show, :edit, :create, :update, :destroy]
    resources :inquiry, only: [:index, :show, :new]
    resources :end_users, only: [:show, :edit, :update]
    resources :favorites, only: [:show]
    resources :histories, only: [:show]
    
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
