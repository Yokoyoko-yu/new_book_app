module SessionsHelper
    def log_in(user)
        token=generate_jwt_token(user.id)
        puts "トークン#{token}"
        cookies[:auth_token]={
            value:token,
            httponly:true,
            expires:1.weeks.from_now,
            same_site: :none,
            secure: true
        }
        # cookies[:auth_token]=token
    end

    def generate_jwt_token(user_id)
        payload = { user_id: user_id, exp: (Time.now + 1.week).to_i }
        JWT.encode(payload, Rails.application.secrets.secret_key_base)
    end

    def logged_in?
        !current_user.nil?
    end

    def log_out
        cookies.delete(:auth_token)
        current_user=nil
        cookies[:auth_token] ={   
        value:"",
        httponly:true,
        same_site: :none,
        secure: true}
        reset_session
        puts "クッキーを削除"
    end


    private

    def current_user
        token = cookies[:auth_token] # Cookieからトークンを取得
        return nil unless token

        begin
        # トークンをデコード
        decoded_token = JWT.decode(token, Rails.application.secret_key_base, true, { algorithm: 'HS256' })
        user_id = decoded_token[0]['user_id'] # ペイロードからuser_idを取得
        puts "id:#{user_id}"
        user=User.find(user_id) # user_idを使ってユーザーを取得
        puts "ユーザー#{user.inspect}"
        return user
        rescue JWT::DecodeError
        nil # トークンが無効な場合
        puts "失敗です"
        end
    end
end
