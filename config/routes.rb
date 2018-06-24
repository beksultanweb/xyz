Rails.application.routes.draw do
	root "links#index"
	get "/:id", to: "links#redirect" 
	post "/create", to: "links#create"
end
