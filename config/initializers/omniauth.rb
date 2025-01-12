Rails.application.config.middleware.use OmniAuth::Builder do #　証人機能
  # 証人プロパイダーとしてLINEを設定　IDチャンネル　IDチャンネルシークレット
  provider :line, ENV['LINE_CHANNEL_ID'], ENV['LINE_CHANNEL_SECRET'], {
    #profile: user,  openid:OpenID, email:ユーザーのメールアドレス
    scope: 'profile openid email'
  }
end