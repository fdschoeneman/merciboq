Merciboq::Application.routes.draw do

  devise_for :users, :controllers => { 
    :users => "users",
    :registrations => "registrations",
    :confirmations => "confirmations",
    :sessions => "sessions" }
     
  devise_scope :user do
    get 'confirm_user', :to => 'confirmations#confirm_user'
    get '/signup',      :to => 'registrations#new'
    get '/delete',      :to => 'registrations#destroy'
    get '/login',       :to => 'sessions#new'
    get '/users/:id',   :to => 'users#destroy', 
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
    get '/' => 'users#show'
  end

  get 'thankyou_by_email/create'  => 'thankyou_by_email#create',
                                :as => :thankyou_by_email
  get 'attachments/:id',
                                :to => 'attachments#show',
                                :as => :attachment
  get 'thankyou/edit/:id',    :to => 'thankyou#edit'

  get '/contact',             :to => 'pages#contact'
  get '/about',               :to => 'pages#about'
  get '/help',                :to => 'pages#help'
  get '/terms',               :to => 'pages#terms'
  get '/privacy',             :to => 'pages#privacy'
  get '/signup',              :to => 'registrations#new'

  get '/thankyous',           :to => 'thankyous#show_thankyous'
  get '/welcomes',            :to => 'thankyous#show_welcomes'
  get '/thankyou/delete',     :to => 'thankyous#delete'
  get '/thankyou/edit',       :to => 'thankyous#edit'
  get '/thankyou/create',     :to => 'thankyous#create'
  get '/thankyou/update',     :to => 'thankyous#update'

  root 'pages#home'

end

