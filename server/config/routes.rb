Rails.application.routes.draw do
  devise_for :users
  root to: 'presents#index'
  resources :users
  resources :holidays
  resources :presents

  scope 'api', as: 'api' do
    get :holidays, to: 'holidays#api_index'
    get :presents, to: 'presents#api_index'
    get 'presents/:id', to: 'presents#api_show'
  end
end
