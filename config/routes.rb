Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace 'api' do
    namespace 'v1' do
      scope 'requests' do
        get '/', to: 'requests#index'
        get '/show/:id', to: 'requests#show'
        post '/create', to: 'requests#create'
        patch '/update/:id', to: 'requests#update'
        patch '/status/:id', to: 'requests#update_status'
        delete '/delete/:id', to: 'requests#delete'
      end
    end
  end
end
