Rails.application.routes.draw do
  namespace :api do
    resources :firefox
    post "/test_url", to: "firefox#test_url"
  end
end
