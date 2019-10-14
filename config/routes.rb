Rails.application.routes.draw do
  get 'order_items/create'
  get 'order_items/update'
  get 'order_items/destroy'
  get 'carts/show'
  get 'list/index'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
  post 'weddings/update_all_individual'
  post 'weddings/update_all_weddings'
  post 'weddings/copy_wedding'
  post 'weddings/send_wedding_email'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :weddings do
    resources :recipes do
      resources :flowers
      resources :hard_goods
    end
  end

  resources :users
  resources :masterflowers
  resource :cart, only: [:show]
  resources :order_items, only: [:create, :update, :destroy]

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  root 'sessions#new'
end
