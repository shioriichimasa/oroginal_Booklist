class ApplicationController < ActionController::Base
  # ページネーションの処理
  include Pagy::Backend
end
