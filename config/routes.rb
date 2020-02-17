Rails.application.routes.draw do
	# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

	#API routes
	namespace :api, constraints: { format: 'json' } do
		namespace :v1 do
			resources :users do
			end

			post '/auth/login', to: 'authentications#login'
		end
	end
end
