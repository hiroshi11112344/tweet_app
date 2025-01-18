Rails.application.config.middleware.use OmniAuth::Builder do #　証人機能
  # 証人プロパイダーとしてLINEを設定　IDチャンネル　IDチャンネルシークレット
  provider :line, ENV['LINE_CHANNEL_ID'], ENV['LINE_CHANNEL_SECRET'], {
    #profile: user,  openid:OpenID, email:ユーザーのメールアドレス
    scope: 'profile openid email',
    # リダイレクト
    redirect_uri: ENV['LINE_LOGIN_REDIRECT_URL'] ,
    provider_ignores_state: true # CSRFチェックを無効化
    
  }
end
# ログの設定
OmniAuth.config.logger = Rails.logger