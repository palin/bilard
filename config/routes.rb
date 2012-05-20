Bilard::Application.routes.draw do

  resources :users do
    member do
      get :all_clubs, :path => "kluby"
      get :reservations, :path => "rezerwacje"
    end
  end

  resources :user_sessions, :path => 'logowanie', :only => [:new, :destroy, :create]

  resources :owners, :path => 'wlasciciel' do
    resources :clubs,     :path => 'kluby' do
      resources :prices,    :path => 'ceny'
      resources :employees, :path => 'pracownicy'
      resources :tables,    :path => 'stoly' do
        resources :reservations, :path => 'rezerwacje'
      end
    end
    member do
      post :generate_token, :path => "nowy_token"
      get :club_data, :path => "dane_klubow"
      post :create_clubs, :path => "nowe_kluby"
      get :all_clubs, :path => "kluby"
      get :all_tables, :path => "stoly"
      get :all_reservations, :path => "rezerwacje"
      get :all_employees, :path => "pracownicy"
    end
  end

  resources :home, :only => [] do
    collection do
      get :offert, :path => 'oferta'
      get :about,  :path => 'onas'
      get :prices, :path => 'cennik'
    end
  end
  match '/get_data', :to => "home#get_data"

  root :to => 'home#index'

end
