Notato::Application.routes.draw do
  devise_for :users, path: "/account"

	require "subdomain"
	constraints(Subdomain) do
		resources :notes
		root to: 'notes#index'
	end

  root to: 'welcome#index'
end
