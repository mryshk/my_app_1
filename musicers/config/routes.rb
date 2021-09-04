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

  resources :groups ,only:[:new,:create,:edit,:update,:show,:index,:destroy] do
    resources :group_users,only:[:create,:destroy,:index]
  end

  get 'home' => 'musics#home', as: 'home'

  get 'search' => 'musics#search', as: 'search'

end
