class SessionsController < ApplicationController
  
  # モデルがないので処理不要
  def new
  end

  # ログイン後
  def create
    #  params にフォームデータは代入されているため、小文字化処置を入れつつ取り出す
    email = params[:session][:email].downcase
    password = params[:session][:password]
    # login(email, password) メソッドで成功可能かどうかを判定
    if login(email, password)
      flash[:success] = 'ログインに成功しました。'
      # @user のusers#showへとリダイレクト
      # ここをトップページとかにしたい
      # そのユーザーの本一覧画面indexにしたい。
      redirect_to books_url
    else
      flash.now[:danger] = 'ログインに失敗しました。'
      # render :new により sessions/new.html.erb を再表示
      render :new
    end
  end

  # ログアウト処理
  def destroy
    session[:user_id] = nil
    flash[:success] = 'ログアウトしました。'
    redirect_to login_url
  end
  
  private

  def login(email, password)
    # 入力フォームの email と同じメールアドレスを持つユーザを検索し @user に代入
    @user = User.find_by(email: email)
    # @user が存在するか、且つ、@user のパスワードが合っているか
    # email, password の組み合わせが間違っていた場合には、ログインできない仕様
    if @user && @user.authenticate(password)
      # ログイン成功
      # ブラウザにはCookieとして、サーバにはSessionとしてログイン状態が維持される
      session[:user_id] = @user.id
      return true
    else
      # ログイン失敗
      return false
    end
  end
end
