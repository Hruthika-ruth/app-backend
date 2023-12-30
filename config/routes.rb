Rails.application.routes.draw do
  # Resourceful routes for users, birth_regs, and death_regs
  resources :users do
    resources :birth_regs, only: [:index, :new, :create, :show] do
    end 
    
    resources :birth_regs, only: [] do
      resources :death_regs, only: [:index, :new, :create, :show], shallow: true 
    end
  end

  # Login and logout routes
  get 'login', to: 'sessions#new', as: 'login'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy', as: 'logout'


  # It's common to have a root path as well, you can uncomment and edit the following line:
  # root 'welcome#index'
end
