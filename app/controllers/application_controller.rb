class ApplicationController < ActionController::Base
  
  # Helperに定義していた logged_in? を使用するために記述
  include SessionsHelper 
  # ページネーションの処理
  include Pagy::Backend
  
  private
  
  # すべてのControllerで使用できるようにここに事前にログイン認証を確認する処理を入れる
  def require_user_logged_in
    #  unless は false のときに処理を実行する
    unless logged_in?
      redirect_to login_url
    end
  end
end
