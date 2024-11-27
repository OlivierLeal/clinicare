Rails.application.routes.draw do
  get 'atualizar_status', to: 'services#atualizar_status', as: :atualizar_status
  resources :services do
    member do
      get :kanban
    end
  end
  resources :calls
  devise_for :users 
  post "impimir", to: "services#gerar_ordem_servico", as: :imprimir
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "home#index"
end
