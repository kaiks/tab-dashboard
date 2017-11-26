Rails.application.routes.draw do

  resources :lists do
    resources :list_items do
      member do
        put :mark_read
      end
    end

    collection do
      get :dashboard
    end
  end


  resources :list_items do
    member do
      put :mark_read
    end
  end

  devise_for :users
  root to: 'lists#dashboard'
end
