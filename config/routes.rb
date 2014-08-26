Drafterize::Application.routes.draw do

  
  resources :drafts do 
    resources :players
  end
  
  devise_for :users
  root to: 'welcome#index'
end