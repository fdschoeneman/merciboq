Merciboq::Application.routes.draw do

  devise_for :users, :controllers => { 
    :users => "users",
    :registrations => "registrations",
    :confirmations => "confirmations",
    :sessions => "sessions" }
     
  devise_scope :user do
    match 'confirm_user', :to => 'confirmations#confirm_user'
    match '/signup',      :to => 'registrations#new'
    match '/delete',      :to => 'registrations#destroy'
    match '/login',       :to => 'sessions#new'
    match '/users/:id',   :to => 'users#destroy', 
                          :as => :destroy_user, :via => :delete
  end

  resources :users, :only => [:show, :index] do
    resources :subdomains, :shallow => true
  end

  resources :users do 
    member do
      get :thankyous, :welcomes, :subordinates, :dominants
    end
  end


  resources :after_signup_wizard

  constraints(Subdomain) do
    match '/' => 'users#show'
  end

  match 'thankyou_by_email/create'  => 'thankyou_by_email#create',
                                :as => :thankyou_by_email
  match 'attachments/:id',
                                :to => 'attachments#show',
                                :as => :attachment
  match 'thankyou/edit/:id',    :to => 'thankyou#edit'

  match '/contact',             :to => 'pages#contact'
  match '/about',               :to => 'pages#about'
  match '/help',                :to => 'pages#help'
  match '/terms',               :to => 'pages#terms'
  match '/privacy',             :to => 'pages#privacy'
  match '/signup',              :to => 'registrations#new'

  match '/thankyous',           :to => 'thankyous#show_thankyous'
  match '/welcomes',            :to => 'thankyous#show_welcomes'
  match '/thankyou/delete',     :to => 'thankyous#delete'
  match '/thankyou/edit',       :to => 'thankyous#edit'
  match '/thankyou/create',     :to => 'thankyous#create'
  match '/thankyou/update',     :to => 'thankyous#update'

  root :to => 'pages#home'

end

