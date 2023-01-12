Rails.application.routes.draw do
  namespace :api do 
    namespace :v1 do
      get '/users', to: 'users#index'
      get '/users/:id', to: 'users#show'
      post '/user/add', to: 'users#create'
      delete '/user/delete/:id', to: 'users#destroy'
      patch '/user/update/:id', to: 'users#update'


      get '/products', to: 'products#index' do
      get :image, on: :member 
    end
      get '/products/:id', to: 'products#show'do
      get :image, on: :member 
    end
      post '/product/add', to: 'products#create'
      delete '/product/delete/:id', to: 'products#destroy'
      patch '/product/update/:id', to: 'products#update'
      
    end
  end
end
