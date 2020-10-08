Rails.application.routes.draw do
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
