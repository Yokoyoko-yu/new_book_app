class UsersController < ApplicationController
    def new 
        @user=User.new
    end

    def create
        @user=User.new(user_resources)
        if @user.save
            log_in(@user)
            redirect_to '/home',status:200
            puts "ユーザ作成成功"
            puts @user
        else
            puts "ユーザの作成に失敗"
            puts @user.errors.full_messages
            render 'new',status: :unprocessable_entity
        end
    end

    private

    def user_resources
        params.require(:user).permit(:name,:email,:password)
    end
end
