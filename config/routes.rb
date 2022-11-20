Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  get 'users/index'
  get 'users/show'
  get 'users/new'
  get 'users/create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # トップページにアクセスしたときのルーティングをindexアクションに設定
  root to: 'books#index'
  
  # HTTPリクエストのメソッドに対するルーティング
  # ７つのルーティングは基本なので以下の省略形で記述OK
  resources :books do
    # 検索機能のルーティング
    collection do
      get 'search'
    end
  end
  
  # uesrモデルのルーティング
  # ユーザの新規登録 URL を/signup にしている
  get 'signup', to: 'users#new'
  resources :users, only: [:create]
  
  # ログイン機能のルーティング
  # URLの見栄えを考慮して、個別にルーティングを設定
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
end
