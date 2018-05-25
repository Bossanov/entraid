Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :profiles do
    resources :articles
    resources :messages

  end
  resources :messages do
    resources :messagecommits
  end
  resources :articles do
    resources :articlecommits
  end
  resources :contacts
end
