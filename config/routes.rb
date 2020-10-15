Rails.application.routes.draw do

  root to:'publics/homes#top'
  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
  }
  devise_for :end_users, controllers: {
    sessions: 'publics/sessions',
    registrations: 'publics/registrations',
  }

  root to:'publics/homes#top'

  namespace :admins do
    resources :novels, only: [:index, :show, :edit, :destroy] do
    resource :favorites, only: [:create, :destroy]
    end
    resources :illustrations, only: [:index, :show, :edit, :destroy]
    resources :series_novels, only: [:index, :show, :edit, :destroy]
    resources :series_illusts, only: [:index, :show, :edit, :destroy]
    resources :inquiries, only: [:index, :show]
    resources :end_users, only: [:index, :show, :edit]
  end

  namespace :publics do

    get '/search', to: 'search#search'
    get "/top"=> "homes#top"
    resources :novels, only: [:index, :show, :edit, :new, :create, :update, :destroy] do
    resource :favorites, only: [:create, :destroy]
    end
    post 'novels/confirm' => 'novels#confirm'
    get 'novels/confirm' => 'novels#error'
    get 'novels/thanks' => 'novels#thanks'

    resources :illustrations, only: [:index, :show, :edit, :new, :create, :update, :destroy]
    resources :series_novels, only: [:new, :index, :show, :edit, :create, :update, :destroy]
    resources :series_iliusts, only: [:new, :index, :show, :edit, :create, :update, :destroy]
    get   'inquiry'         => 'inquiry#index'     # 入力画面
    post  'inquiry/confirm' => 'inquiry#confirm'   # 確認画面
    post  'inquiry/thanks'  => 'inquiry#thanks'    # 送信完了画面
    resources :end_users, only: [:show, :edit, :update]
    resources :histories, only: [:show]
    
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
