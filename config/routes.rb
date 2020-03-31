# frozen_string_literal: true

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
    registrations: 'users/registrations',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  namespace :admins do
    root 'orders#top'
    resources :users, only: %i[index show edit update] do
      collection do
        get :search
      end
    end
    resources :products
    resources :orders, only: %i[index show update] do
      collection do
        get :search
      end
    end
    resources :product_kinds, only: %i[index create edit update destroy]
    resources :combos,       only: %i[index edit create update destroy]
    resources :combo_items,  only: %i[show index create update destroy]
    resources :admins,       only: %i[index show edit update]
  end

  namespace :users do
    root 'users#top'
    get 'users/point'
    get 'users/confirm'
    get 'orders/confirm'
    post 'orders/save'
    get 'orders/thanks'
    delete 'cart_items/destroy_all'
    get 'cart_items/save'
    resources :users,        only: %i[show edit update]
    resources :products,     only: %i[index show] do
      resource :favorites, only: %i[create destroy]
      resource  :likes, only: %i[create destroy]
      resources :product_comments, only: %i[create destroy]
    end
    resources :orders
    resources :cart_items,   only: %i[index update destroy create]
    resources :creditcards,  only: %i[index new destroy create edit update]
    resources :combo_items,  only: [:index]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
