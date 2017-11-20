Rails.application.routes.draw do
  root to: 'list_items#dashboard'

  resources :list_items do
    member do
      put :mark_read
    end
    collection do
      get :dashboard
    end
  end
end
