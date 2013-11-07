Giraffle::Application.routes.draw do
	get 'sign_up', to: 'groups#new', as: 'sign_up'
	get 'sign_in', to: 'sessions#new', as: 'sign_in'
	delete 'sign_out', to: 'sessions#destroy', as: 'sign_out'

	resources :members
  resources :groups
  
  root :to => 'high_voltage/pages#show', id: 'welcome'
end