Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount LetsencryptPlugin::Engine, at: '/'  # It must be at root level


  namespace :api do
    resources :readings do
      collection do
        get "latest", to: "readings#latest"
        get "recent", to: "readings#recent"
        get "sensors"
      end
    end
  end

end
