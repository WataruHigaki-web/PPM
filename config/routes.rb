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
    get 'products/set_index'
    get 'products/set_show'
    resources :users,        only:[:index,:show,:edit,:update]
    resources :products
    resources :orders,       only:[:index,:show,:update]
    resources :order_records,only:[:index,:show,:update]
    resources :product_kinds
    resources :admins,       only:[:index,:show,:edit,:update]
  end

  namespace :users do
    get 'users/point'
    get 'users/confirm'
    get 'orders/confirm'
    resources :users,        only:[:show,:edit,:update]
    resources :products,     only:[:index,:show]
    resources :orders,       only:[:new,:create]
    resources :cart_items,   only:[:index,:edit,:update,:destroy,:create]
    resources :creditcards
    resources :favorites,    only:[:index,:show]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
