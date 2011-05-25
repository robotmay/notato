Notato::Application.routes.draw do
  devise_for :users, path: "/account"

	#TODO Subdomains for public notepatches
	#require "subdomain"
	#constraints(Subdomain) do
	#	root to: 'notes#index'
	#end

	resources :notepatches do
		resources :notes
	end

  root to: 'welcome#index'
end
