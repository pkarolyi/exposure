Rails.application.routes.draw do
  devise_for :admins
  resources :galleries do
    resources :images, :only => [:create, :destroy]
  end

  get 'admin', to: 'galleries#admin', as: :gallery_admin

  root to: 'galleries#index'
end
