Rails.application.routes.draw do
  
  scope module: :public do
    resources :ships, except: [:new, :show]
    resources :items, only: [:index, :show]
    resources :orders, only: [:new, :create, :index, :show] do
      collection do
        post "confirm"
        get "complete"
      end 
    end
    
    resources :cart_items, only: [:index, :create, :update, :destroy] do
      collection do
        delete "destroy_all"
      end 
    end 
    
    resource :customers, only: [:show, :edit, :update] do
      get "unsubscribe"
      patch "withdraw"
    end 
  end 
  
  namespace :admin do
    get "/" => "homes#top"
    resources :items, except: [:destroy]
    resources :customers, except: [:new, :show, :destory]
    resources :orders, only: [:indes, :show, :update]
    resources :order_details, only: [:update]
  end
  
  scope module: :public do
    root to: 'homes#top'
    get '/about' => 'homes#about', as: 'about'
  end
  
  devise_for :customers, controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
  
end
