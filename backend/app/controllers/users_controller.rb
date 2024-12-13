class UsersController < ApplicationController
    def new 
        @user=User.new
    end

    def create
        @user=User.new(user_resources)
        if @user.save
            log_in(@user)
            redirect_to '/home'
            puts "ユーザ作成成功"
        else
            puts "ユーザの作成に失敗"
            render 'new',stauts: :unprocessable_enitiy
        end
    end

    private

    def user_resources
        params.require(:user).permit(:name,:email,:password)
    end
end
