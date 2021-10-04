RottenpotatoesHome::Application.routes.draw do
  resources :movies do
    resources :reviews
  end
  root :to => redirect('/movies')
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#auth'
  post 'logout' => 'sessions#destroy'
end