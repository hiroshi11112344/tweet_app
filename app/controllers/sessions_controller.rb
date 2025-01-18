class SessionsController < ApplicationController

  # OmniAuthエラーのハンドリング
  rescue_from OmniAuth::Strategies::OAuth2::CallbackError, with: :auth_failure
  skip_before_action :verify_authenticity_token, only: [:create]
  
  def create
    # 証人情報取得
    auth = request.env['omniauth.auth']
    # LINEユーザーIDが一致するユーザーをデータベースから検索　いなければ新規で作成
    user = User.find_or_create_by(line_uid: auth['uid']) do |u|
      u.name = auth['info']['name'] # LINEアカウント名前取得
      # @line.example.com" LINEアカウントemail取　*現在仮のアドレスを設定中
      u.email = auth['info']['email'] || "#{auth['uid']}@line.example.com" 
    end
    session[:user_id] = user.id
    redirect_to root_path, notice: "ログインしました！"
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "ログアウトしました！"
  end

  # OmniAuthエラー時の処理
  def auth_failure
    redirect_to root_path, alert: "ログインに失敗しました。"
  end
end
