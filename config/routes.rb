# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html

RedmineApp::Application.routes.draw do
  get 'semantic_search', to: 'semantic_search#index'

  get 'semantic_search/settings', to: 'semantic_search#settings'
  post 'semantic_search/settings', to: 'semantic_search#update_settings'

  post 'semantic_search/sync_embeddings', to: 'semantic_search#sync_embeddings'
end
