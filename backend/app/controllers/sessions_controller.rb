# require 'jwt'
class SessionsController < ApplicationController

    def create
        puts "params:#{params}"
        user=User.find_by(email: params[:session][:email].downcase)
        if user&&user.authenticate(params[:session][:password])
            reset_session
            puts "aka"
            log_in(user)
            puts "レスポンス"
            puts response
            puts "ao"
            redirect_to '/home',status:200
            Rails.logger.info('ログイン成功です')
            # puts ('ログイン成功です')
            # render json: { message: 'ログイン成功です', user: user }, status: :ok
        else
            Rails.logger.info('失敗です')
            render :new,status: :unprocessable_entity
        end
    end

    def destroy
        # session.delete(:user_id)
        log_out
        render json: { message: 'ログアウト成功' }, status: 200
        # redirect_to root_path
    end

    def user
        Rails.logger.info "Cookies: #{cookies.inspect}-----"
        if logged_in?
            render json:{user:current_user}
            puts '成功'
        else
            Rails.logger.info('だめだ失敗')
            # render json: { error: "Not logged in" }, status: :unauthorized
            render json:{user_name:"null"}
        end
    end
end
