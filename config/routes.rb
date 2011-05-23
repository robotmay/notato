Notato::Application.routes.draw do
  devise_for :users, path: "/account"

  root :to => 'welcome#index'
end
