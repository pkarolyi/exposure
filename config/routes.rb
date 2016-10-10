Rails.application.routes.draw do
  devise_for :admins, :skip => [:registrations], controllers: {
      sessions: 'admins/sessions'
  }
  as :admin do
    get 'admins/edit' => 'devise/registrations#edit', :as => 'edit_admin_registration'
    put 'admins' => 'devise/registrations#update', :as => 'admin_registration'
  end

  resources :galleries do
    resources :images, :only => [:create, :destroy]
  end

  get 'admin', to: 'galleries#admin', as: :gallery_admin

  root to: 'galleries#index'
end
