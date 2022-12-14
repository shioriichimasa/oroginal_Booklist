class BooksController < ApplicationController
  # 事前のログイン確認
  before_action :require_user_logged_in
  before_action :correct_user, only: [:show, :edit, :update, :destroy]
  # 検索機能：privateに設定した検索に関するメソッドを呼び出す
  before_action :set_q, only: [:index, :search]
  
  
  # 登録した本の一覧表示画面
  def index
    # View側で使用するためにbooksという変数に入れている
    # 登録した全ての本のため、変数はbooksという複数形
    # .order(id: :desc)はid のカラムを基準に降順になる
    # itemsはページネーションで表示させる件数
    @pagy, @books = pagy(Book.order(id: :desc), items:5)
  end

  # 特定idの本の詳細画面
  def show
  end

  # 本の新規登録画面
  def new
    @book = Book.new
  end

  # newから送信されるフォームの処理
  def create
    # セキュリティ対策からStrongParameterの処理を使う
    @book = current_user.books.build(book_params)
    if @book.save
      flash[:success] = 'Book が正常に登録されました'
      # redirect_to はリンク先を指定して強制的に飛ばすメソッド
      # 以下のリンク先@bookは link_to と同様で、@book のshowルーティング（books/:id）
      redirect_to @book
    else
      flash.now[:danger] = 'Book が登録されませんでした'
      # render :new はbooks/new.html.erb を表示するということ
      render :new
    end
  end

  # 登録した本情報の編集
  def edit
  end

  # 編集後のアップデートアクション
  def update
    if @book.update(book_params)
      flash[:success] = 'Book は正常に更新されました'
      redirect_to @book
    else
      flash.now[:danger] = 'Book は更新されませんでした'
      render :edit
    end
  end

  # 削除の処理
  def destroy
    @book.destroy
    flash[:success] = 'Book は正常に削除されました'
    # indexへリダイレクト,リダイレクトの時だけ_urlになる
    redirect_to books_url
  end
  
  # 検索機能
  def search
    # resultはransackメソッドで取得したデータをActiveRecord_Relationのオブジェクトに変換するメソッド
    # distinct: trueは重複したデータを除外
    @results = @q.result(distinct: true)
  end
  
  

  private

  # セキュリティ対策
  # Strong Parameter
  def book_params
    params.require(:book).permit(:title, :author, :review)
  end
  
  # 検索メソッドransack
  def set_q
    @q = Book.ransack(params[:q])
  end
  
  # ログインユーザーのbookに絞る
  def correct_user
    @book = current_user.books.find_by(id: params[:id])
    unless @book
      redirect_to root_url
    end
  end
  
end
