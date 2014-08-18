Drafterize::Application.routes.draw do

  resources :players
  resources :drafts
  
  devise_for :users
  root to: 'welcome#index'
end