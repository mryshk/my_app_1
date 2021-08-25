Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'

  resources :users, only: [:show,:edit,:update] do
    resource :relationships, only: [:create,:destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end
  resources :musics, only: [:new, :create, :index, :show, :destroy, :edit,:update] do
    resource :favorites ,only:[:create,:destroy]

    resources :music_comments, only:[:new,:create,:edit,:destroy,:update]
  end


end
