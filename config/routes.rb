Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # トップページにアクセスしたときのルーティングをindexアクションに設定
  root to: 'books#index'
  
  # HTTPリクエストのメソッドに対するルーティング
  # ７つのルーティングは基本なので以下の省略形で記述OK
  # resources :books

  
  # 検索機能のルーティング
  resources :books do
    collection do
      get 'search'
    end
  end
end
  
  # ログイン機能のルーティング
  # get 'signup', to: 'users#new'
  # resources :users, only: [:create]
  
  # get 'login', to: 'sessions#new'
  # post 'login', to: 'sessions#create'
  # delete 'logout', to: 'sessions#destroy'

