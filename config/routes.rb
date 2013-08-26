Spree::Core::Engine.routes.draw do
  resources :orders do
    resource :checkout, :controller => 'checkout' do
      member do
        get :payment_checkout
        get :payment_payment
        get :payment_confirm
        post :payment_finish
      end
    end
  end

  match '/payment_notify' => 'payment_express_callbacks#notify', :via => [:get, :post]

  match '/payment_shipping_update' => 'payment_express_callbacks#shipping_estimate', :via => :post

  namespace :admin do
    resources :orders do
      resources :payment_payments do
        member do
          get :refund
          get :capture
        end
      end
    end
  end
end
