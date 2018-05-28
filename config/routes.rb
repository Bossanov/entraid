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

  get 'pages/pourquoi'
  get 'pages/info'
  get 'pages/liens'
  get 'pages/admin'
  get 'valider_profile', to: 'profiles#valider_profile'
  get 'refuser_profile', to: 'profiles#refuser_profile'
  get 'valider_article', to: 'articles#valider_article'
  get 'refuser_article', to: 'articles#refuser_article'
  get 'effacer_contact', to: 'contacts#effacer_contact'
  get 'bloquer_profile', to: 'profiles#bloquer_profile'
  get 'supprimer_profile', to: 'profiles#supprimer_profile'
  get 'debloquer_profile', to: 'profiles#debloquer_profile'


end
