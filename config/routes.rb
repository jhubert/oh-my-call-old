Ohmycall::Application.routes.draw do
  resources :people
  match "people/:id" => "people#update", via: :patch
end
