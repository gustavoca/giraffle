Giraffle::Application.routes.draw do
	get 'sign_up', to: 'groups#new', as: 'sign_up'
	get 'sign_in', to: 'sessions#new', as: 'sign_in'
	delete 'sign_out', to: 'sessions#destroy', as: 'sign_out'

	resources :sessions
	resources :members
  resources :groups
  resources :events
  resources :event_sets
  
  get "/pages/*id" => 'pages#show', :as => :page, :format => false
  root :to => 'high_voltage/pages#show', id: 'welcome'
end
