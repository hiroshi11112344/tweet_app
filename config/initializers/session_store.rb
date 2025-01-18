
# 本番環境で勉強しよう　セキュリティに関する事
Rails.application.config.session_store :cookie_store, key: '_your_app_session', secure: Rails.env.production?
