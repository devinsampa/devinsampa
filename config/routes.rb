Devinsampa::Application.routes.draw do
  get "/palestrantes" => redirect("/palestras")
  get "/divulgar" => redirect("/")
  get "/feedback" => redirect("/contato")

  namespace :admin do
    resources :speakers, :collection => { :report => :get }
    resources :agendas
    resources :presentations
    
    controller :system_configurations do
    	get "settings/edit" => :edit, :as => "settings"
    	put "settings/update" => :update, :as => "update_settings"
    end
    
    resources :attendees do
      member do 
      	get :resend
        put :completed
        put :pending
        put :approved
        put :verifying
        put :canceled
        put :refunded
        get :warning
      end

      get :report, :on => :collection
    end
    
    resources :user_sessions
  end
  
  controller :attendees do
  	post "/inscricao/nova" => :create
  	get "/inscricao" => :new
  	get "/inscricao/pagseguro/confirmacao" => :pagseguro, :as => "pagseguro_confirmation"
  	get "/inscricao/pagamento/:token" => :payment, :as => "payment"
  end

  controller :user_sessions do
  	get "/login" => :new, :as => "login"
  	get "/logout" => :destroy, :as => "logout"
  end
  
  root :to => "pages#index"

  controller :pages do
    get "/contato" => :contact, :as => "contact"
    get "/2009" => :photos_and_videos_2009, :as => "photos_and_videos_2009"
    get "/palestras" => :presentations, :as => "presentations"
    get "/programacao" => :agenda, :as => "agenda" 
  end

  get "/admin" => "Admin::Admin#index", :as => "admin"

  match "*minvalid_route" => "pages#not_found"
end
