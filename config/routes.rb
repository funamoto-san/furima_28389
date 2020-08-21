Rails.application.routes.draw do
  devise_for :users
  
  root "items#index"
  resources :items
  resources :orders, only: [:index]
  
end

# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
# render :new
# ルーティングを経由しない
# →エラーメッセージが表示される

# redirect_to（りろーどぼたん）
# →エラーメッセージが表示されない