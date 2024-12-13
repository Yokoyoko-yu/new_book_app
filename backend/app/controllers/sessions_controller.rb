require 'jwt'
class SessionsController < ApplicationController
    def new
    end

    def create
        # Rails.logger(params[:session])
        # puts params[:session][:email]
        # Rails.logger.info(params[:session])
        user=User.find_by(email: params[:session][:email].downcase)
        if user&&user.authenticate(params[:session][:password])
            reset_session
            puts "aka"
            log_in(user)
            puts "ao"
            redirect_to '/home'
            Rails.logger.info('ログイン成功です')
        else
            Rails.logger.info('kkk')
            render :new,status: :unprocessable_entity
        end
    end

    def destroy
        # session.delete(:user_id)
        log_out
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
