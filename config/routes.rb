Rails.application.routes.draw do

  resources :to_do_items do
    member do
      put :mark_done
      put :mark_removed
    end
  end


  resources :lists do
    resources :list_items do
      member do
        put :mark_read
        put :mark_removed
      end
    end
  end


  resources :list_items do
    member do
      put :mark_read
      put :mark_removed
    end
  end

  resources :knowledge_repositories

  devise_for :users
  root to: 'dashboard#show'
end
