require "sidekiq/web"

Rails.application.routes.draw do
  Sidekiq::Web.use Rack::Auth::Basic do |username, password|
    ActiveSupport::SecurityUtils.secure_compare(::Digest::SHA256.hexdigest(username), ::Digest::SHA256.hexdigest(ENV["SIDEKIQ_USERNAME"])) &
      ActiveSupport::SecurityUtils.secure_compare(::Digest::SHA256.hexdigest(password), ::Digest::SHA256.hexdigest(ENV["SIDEKIQ_PASSWORD"]))
  end
  mount Sidekiq::Web, at: "/sidekiq"

  #resources :admin
  # Devise
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :users, only: [:show]
  post '/users/update', to: 'users#update'
  post '/users/cancel_subscription', to: 'users#cancel_subscription'

  resources :donations, only: [:create, :show, :new]
  resources :payment_intents
  resources :webhooks, only: [:create]
  resources :fmpages, only: [:show]

  root to: 'pages#home'
  post "send_contact" => "pages#send_contact"
end
