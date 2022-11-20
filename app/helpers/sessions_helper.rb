module SessionsHelper
  # 現在ログインしているユーザを取得するメソッド
  def current_user
    # @すでに現在のログインユーザが代入されていたら何もせず、されていなかったら User.find_by()でログインユーザを取得
    @current_user ||= User.find_by(id: session[:user_id])
  end
  
  # ユーザがログインしているかどうを判定
  def logged_in?
    !!current_user
  end
end
