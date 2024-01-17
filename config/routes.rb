Rails.application.routes.draw do
  resources :users do
    resources :birth_regs, only: [:index, :new, :create, :show], defaults: { format: 'json' } do
      resources :death_regs, only: [:index, :new, :create, :show], defaults: { format: 'json' }, shallow: true 
    end 
  end

  resources :birth_regs do
    resources :death_regs
  end
  
  # get 'login', to: 'sessions#new', as: 'login'
  # post 'login', to: 'sessions#create'
  # delete 'logout', to: 'sessions#destroy', as: 'logout'
end
