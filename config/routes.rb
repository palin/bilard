Bilard::Application.routes.draw do

  resources :users

  resources :user_sessions, :path => 'logowanie', :only => [:new, :destroy, :create]

  resources :owners, :path => 'wlasciciel' do
    resources :clubs,     :path => 'kluby' do
      resources :prices,    :path => 'ceny'
      resources :employees, :path => 'pracownicy'
      resources :tables,    :path => 'stoly' do
        resources :reservations, :path => 'rezerwacje'
      end
    end
  end
  resources :home, :only => [] do
    collection do
      get :offert, :path => 'oferta'
      get :about,  :path => 'onas'
      get :prices, :path => 'cennik'
    end
  end

  root :to => 'home#index'

end
