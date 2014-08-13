Drafterize::Application.routes.draw do

  get "drafts/index"
  get "drafts/show"
  devise_for :users
  root to: 'welcome#index'
end