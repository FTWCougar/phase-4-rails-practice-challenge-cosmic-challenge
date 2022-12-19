Rails.application.routes.draw do
    resources :planets, only: [:index]
    resources :missions, only: [:create]
    resources :scientists
end
