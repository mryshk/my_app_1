Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'

  resources :users, only: [:show,:edit,:update]
  resources :musics, only: [:new, :create, :index, :show, :destroy, :edit,:update] do
    resources :music_comments, only:[:create,:edit,:destroy,:update]
  end
  resource :favorites ,only:[:create,:destroy]

end
