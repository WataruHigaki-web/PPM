Rails.application.routes.draw do

  root 'users/products#top'

  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }

  namespace :admins do
    root 'orders#top'
    resources :users,        only:[:index,:show,:edit,:update]
    resources :products
    resources :orders,       only:[:index,:show,:update]
    resources :product_kinds,only:[:index,:create,:edit,:update,:destroy]
    resources :combos,       only:[:index,:edit,:create,:update,:destroy]
    resources :combo_items,  only:[:show,:index,:create,:update,:destroy]
    resources :admins,       only:[:index,:show,:edit,:update]
  end

  namespace :users do
    root 'users#top'
    get 'users/point'
    get 'users/confirm'
    get 'orders/confirm'
    post 'orders/save'
    get 'orders/thanks'
    delete 'cart_items/destroy_all'
    resources :users,        only:[:show,:edit,:update]
    resources :products,     only:[:index,:show] do
      resource :favorites, only: [:create,:destroy]
    end
    resources :orders,       only:[:index,:show,:new,:create]
    resources :cart_items,   only:[:index,:update,:destroy,:create]
    resources :creditcards,  only:[:index,:edit,:update,:destroy,:create]
    resources :combo_items,  only:[:index]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
