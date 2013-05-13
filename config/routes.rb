Designation::Application.routes.draw do
  root :to => "home#index"
  match ":specific_landmark_slug" => "home#index"
end
