Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "question#create"
  resources :questions, only: [:create, :index] do
    collection do
      post "admin_update"
    end
  end

  get "question_by_name", to: 'questions#question_by_name'
end
