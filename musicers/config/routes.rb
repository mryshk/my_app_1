Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  
  resources :users,only:[:show,:index,:edit,:update]
  resources :musics,only:[:new,:create,:index,:show,:destroy,:edit]
  
end
