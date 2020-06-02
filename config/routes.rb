Rails.application.routes.draw do
  devise_for :end_users,controllers: {
  sessions:      'end_users/sessions',
  passwords:     'end_users/passwords',
  registrations: 'end_users/registrations'
}

 get '/end_user/mypage'=> 'end_users/end_users#show', as: 'mypage_end_user'
  
 scope module: :end_users do
    get 'end_users/confirm'
   resource :end_users,only: [:show, :edit, :update, :destroy]
   resources :items,only: [:index, :show]
   resources :addresses
   resources :cart_items do
    collection do
      delete 'destroy_all'
    end
   end
   resources :orders,only: [:new, :index, :show, :create] do
      collection do
        get 'confirm'
        post 'excreate'
        get 'complete'
      end
    end
  end

  devise_for :admins,controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}

 namespace :admins do
    resources :items,only: [:index, :new, :show, :edit, :create, :update, :destroy]
    resources :genres, only:[:index, :edit, :create]
    resources :end_users
    resources :orders,only: [:index, :show, :update]
    resources :order_details,only: [:update]
  end



  root :to => 'homes#top'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
