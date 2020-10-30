Rails.application.routes.draw do
  # scope "/:locale" do
  # end
  resources :users
  
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    ActiveAdmin.routes(self)
    root 'home#index'
    post '/request', to: 'home#request_form'
    get '/success', to: 'home#success'
    get '/get_cities_by_region', to: 'home#get_cities_by_region'
    get '/get_institutions', to: 'home#get_institutions'
    get '/get_education_programs', to: 'home#get_education_programs'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
