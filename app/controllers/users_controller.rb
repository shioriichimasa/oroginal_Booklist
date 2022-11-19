class UsersController < ApplicationController
  
  # topページ
  def index
  end

  # 新規登録画面
  def new
    @user = User.new
  end

  # 新規登録後
  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = 'ユーザを登録しました。'
      # redirect_to @user は、 処理をusers#showのアクションへと強制的に移動させるもの
      # ※エラーになる！ログイン画面に遷移させる必要あり
      redirect_to @user
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      # render :new はusers/new.html.erb を表示する
      render :new
    end
  end
  
  private

  # Strong Paramterで、name, email, password, password_confirmation を許可
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
end
