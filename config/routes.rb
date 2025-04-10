# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html

RedmineApp::Application.routes.draw do
  match 'motivation', to: 'motivation#index', via: :get
  match 'motivation/update', to: 'motivation#update', via: :post
end
