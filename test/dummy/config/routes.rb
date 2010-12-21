Dummy::Application.routes.draw do
  root :to => "entrances#index"
  resources :entrances
end
