Rails.application.routes.draw do

  resources :universities do
    resources :faculties  do
      resources :student_libraries do
        resources :books
      end
    end
  end

  devise_for :users

  root to: "welcome#index"

end
