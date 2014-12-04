Rails.application.routes.draw do
  namespace :api do
    resources :firefox
    post "/har_file/new", to: "firefox#test_url"
  end
end
