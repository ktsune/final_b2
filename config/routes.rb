Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :students, only: :show
  resources :courses, only: [:index, :show]

  post '/students/:id', to: 'students#enroll'
  patch '/courses/:id', to: 'courses#unenroll'
end
