Votebunny::Application.routes.draw do
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  root :to => 'sessions#show', :as => 'home'
  # login
  match '/login' => 'sessions#show', :via => :get, :as => 'show_login'
  match '/login' => 'sessions#login', :via => :post, :as => 'login'
  match '/logout' => 'sessions#destroy', :as => 'logout'
  # elections
  match '/elections' => 'elections#index', :as => 'elections'
  match '/election/new' => 'elections#new', :as => 'new_election'
  match '/election/create' => 'elections#create', :as => 'create_election'
  match '/election/:eid' => 'elections#show', :as => 'election'
  # positions
  match '/election/:eid/position/:pid' => 'positions#show', :via => :get, :as => 'position'
  match '/election/:eid/position/:pid' => 'positions#vote', :via => :post, :as => 'vote'
end
