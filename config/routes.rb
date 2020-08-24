Rails.application.routes.draw do
  namespace :api, defaults: {format: :json} do 
    namespace :v1 do
      namespace :user do
      post :login 
      post :create
      delete :logout
      get :me
      end
      namespace :movie do
        get :index
        get :show
        post :create
        patch :update
        delete :destroy
        get :get_upload_credentials

      end
      namespace :review do 
        get :index
        get :show
        post :create
        patch :update
        delete :destroy
      end
    end
  end
end
